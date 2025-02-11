import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:harun_driweather/core/configs/divider_constant.dart';
import 'package:harun_driweather/core/configs/themes.dart';
import 'package:harun_driweather/modules/presentation/widgets/svg_ui.dart';
import 'package:latlong2/latlong.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  LatLng selectedLocation = LatLng(-3.3167, 114.5901);

  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          setState(() {
            selectedLocation = LatLng(-3.3167, 114.5901);
          });
        },
        backgroundColor: Colors.white,
        child: SvgUI('ic_my_location.svg', color: blueColor300),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            /// Map
            FlutterMap(
              options: MapOptions(
                initialCenter: selectedLocation,
                initialZoom: 5.5,
                onTap: (tapPosition, point) {
                  setState(() {
                    selectedLocation = point;
                    print(
                      'Location changed to: ${selectedLocation.latitude}, ${selectedLocation.longitude}',
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
                      point: selectedLocation,
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildSearchBar(),
                    // buildRecentSearchesPanel(),
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
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
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
                // TODO: Implement search functionality
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
      mainAxisSize: MainAxisSize.min,
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
        _buildRecentSearch("Surabaya"),
        _buildRecentSearch("Banjarmasin"),
        _buildRecentSearch("Yogyakarta"),
      ],
    );
  }

  /// Recent Search List Tile
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
        setState(() {
          if (city == "Surabaya") {
            selectedLocation = LatLng(-7.2504, 112.7688);
          } else if (city == "Banjarmasin") {
            selectedLocation = LatLng(-3.3167, 114.5901);
          } else if (city == "Yogyakarta") {
            selectedLocation = LatLng(-7.7956, 110.3695);
          }
        });
      },
    );
  }
}
