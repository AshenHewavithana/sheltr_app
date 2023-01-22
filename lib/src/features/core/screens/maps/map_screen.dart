import 'dart:async';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sheltr_flutter/src/constants/colors.dart';
import 'package:sheltr_flutter/src/features/core/models/autocomplete_results.dart';
import 'package:sheltr_flutter/src/features/core/providers/search_places.dart';
import 'package:sheltr_flutter/src/features/core/services/map_services.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  // Debouce to throttle the async calls during search
  Timer? _debounce;

  // Toggle UI
  bool searchToggle = false;
  bool radiusSlider = false;
  bool pressedNear = false;
  bool cardTapped = false;
  bool getDirections = false;

  // Markers set
  Set<Marker> _markers = Set<Marker>();
  int markerIdCounter = 1;

  // Text Editing Controllers
  TextEditingController searchController = TextEditingController();

  // Initial Map Position on load
  static final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(6.817669149399968, 79.89034059028049), zoom: 14.0);

  void _setMarker(point) {
    var counter = markerIdCounter++;
    final Marker marker = Marker(
        markerId: MarkerId('marker_$counter'),
        position: point,
        onTap: () {},
        icon: BitmapDescriptor.defaultMarker);

    setState(() {
      _markers.add(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Providers
    final allSearchResults = ref.watch(placeResultsProvider);
    final searchFlag = ref.watch(searchToggleProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeight,
                  width: screenWidth,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    markers: _markers,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                searchToggle
                    ? Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 75.0, 15.0, 5.0),
                        child: Column(
                          children: [
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                controller: searchController,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                      vertical: 15.0,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Search',
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          searchToggle = false;
                                          searchController.text = '';
                                          searchFlag.toggleSearch();
                                          _markers = {};
                                        });
                                      },
                                      icon: Icon(Icons.close),
                                    )),
                                onChanged: (value) {
                                  if (_debounce?.isActive ?? false)
                                    _debounce?.cancel();
                                  _debounce = Timer(Duration(milliseconds: 700),
                                      () async {
                                    if (value.length > 2) {
                                      if (!searchFlag.searchToggle) {
                                        searchFlag.toggleSearch();
                                        _markers = {};
                                      }

                                      List<AutoCompleteResult> searchResults =
                                          await MapServices()
                                              .searchPlaces(value);

                                      allSearchResults
                                          .setResults(searchResults);
                                    } else {
                                      List<AutoCompleteResult> emptyList = [];
                                      allSearchResults.setResults(emptyList);
                                    }
                                  });
                                },
                              ),
                            )
                          ],
                        ))
                    : Column(),
                searchFlag.searchToggle
                    ? allSearchResults.allReturnedResults.length != 0
                        ? Positioned(
                            top: 125.0,
                            left: 15.0,
                            child: Container(
                              height: 200.0,
                              width: screenWidth - 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white.withOpacity(0.7),
                              ),
                              child: ListView(
                                children: [
                                  ...allSearchResults.allReturnedResults
                                      .map((e) => buildListItem(e, searchFlag))
                                ],
                              ),
                            ))
                        : Positioned(
                            top: 125.0,
                            left: 15.0,
                            child: Container(
                              height: 200.0,
                              width: screenWidth - 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white.withOpacity(0.7),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("No results to show",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      width: 125.0,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          searchFlag.toggleSearch();
                                        },
                                        child: Center(
                                          child: Text(
                                            "Close",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.apply(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                    : Container()
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FabCircularMenu(
        alignment: Alignment.bottomLeft,
        fabColor: PrimaryColor,
        fabOpenColor: AccentColor,
        ringDiameter: 250,
        ringWidth: 60,
        ringColor: PrimaryColor,
        fabSize: 60.0,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  searchToggle = true;
                  radiusSlider = false;
                  pressedNear = false;
                  cardTapped = false;
                  getDirections = false;
                });
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.home))
        ],
      ),
    );
  }

  Future<void> gotoSearchedPlace(double lat, double lng) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 14.0)));
  }

  Widget buildListItem(AutoCompleteResult placeItem, searchFlag) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTapDown: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: () async {
          var place = await MapServices().getPlaces(placeItem.placeId);
          gotoSearchedPlace(place['geometry']['location']['lat'],
              place['geometry']['location']['lng']);
          searchFlag.toggleSearch();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: Colors.green, size: 25.0),
            SizedBox(width: 4.0),
            Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width - 75.0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(placeItem.description ?? ''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
