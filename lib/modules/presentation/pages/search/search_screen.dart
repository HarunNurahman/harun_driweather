import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:harun_driweather/core/configs/divider_constant.dart';
import 'package:harun_driweather/core/configs/themes.dart';
import 'package:harun_driweather/core/services/location_service.dart';
import 'package:harun_driweather/modules/presentation/widgets/svg_ui.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  final double currentLat;
  final double currentLon;
  const SearchScreen({
    super.key,
    required this.currentLat,
    required this.currentLon,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late LatLng currentLocation;

  final List<String> searchHistory = [];

  double lat = 0.0;
  double lon = 0.0;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentLocation = LatLng(widget.currentLat, widget.currentLon);
    _loadSearchHistory();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await LocationService().getCurrentLocation();
      setState(() {
        lat = position.latitude;
        lon = position.longitude;
        currentLocation = LatLng(lat, lon);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  Future<void> _searchLocation(String query) async {
    try {
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        setState(() {
          lat = locations.first.latitude;
          lon = locations.first.longitude;
          currentLocation = LatLng(lat, lon);

          if (!searchHistory.contains(query)) {
            if (searchHistory.length >= 3) {
              searchHistory.removeAt(0);
            }
            searchHistory.add(query);
            _saveSearchHistory();
          }
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Location not found'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  Future<void> _saveSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('searchHistory', searchHistory);
  }

  Future<void> _loadSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? history = prefs.getStringList('searchHistory');
    if (history != null) {
      setState(() {
        searchHistory.addAll(history);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () async {
          await _getCurrentLocation();
          setState(() {
            currentLocation = LatLng(lat, lon);
          });
        },
        backgroundColor: Colors.white,
        child: SvgUI('ic_my_location.svg', color: blueColor300),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: currentLocation,
                initialZoom: 5.5,
                onTap: (tapPosition, point) {
                  setState(() {
                    currentLocation = point;
                    lat = point.latitude;
                    lon = point.longitude;
                    print(
                      'Location changed to: ${currentLocation.latitude}, ${currentLocation.longitude}',
                    );
                  });
                },
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: currentLocation,
                      width: 40,
                      height: 40,
                      child: SvgUI('ic_pin_location.svg'),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSearchBar(),
                    divide32,
                    buildRecentSearchesPanel(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context, {'lat': lat, 'lon': lon}),
            child: SvgUI('ic_arrow_left.svg'),
          ),
          divideW10,
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search here",
                border: InputBorder.none,
                hintStyle: blackTextStyle.copyWith(
                  fontSize: 18,
                  color: blueColor300,
                ),
              ),
              onSubmitted: (value) {
                _searchLocation(value);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecentSearchesPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent search",
          style: blackTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: blueColor300,
          ),
        ),
        divide10,
        for (String query in searchHistory) _buildRecentSearch(query),
      ],
    );
  }

  Widget _buildRecentSearch(String city) {
    return ListTile(
      leading: SvgUI('ic_clock.svg'),
      title: Text(
        city,
        style: blackTextStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: blueColor300,
        ),
      ),
      onTap: () {
        _searchLocation(city);
      },
    );
  }
}
