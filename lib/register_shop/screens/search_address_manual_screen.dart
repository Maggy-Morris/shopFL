import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:anwer_shop/authentication/widgets/custom_textbutton.dart';
import 'package:anwer_shop/constants/colors.dart';
import 'package:anwer_shop/models/address.dart';
import 'package:anwer_shop/providers/location_provider.dart';
import 'package:anwer_shop/register_shop/controllers/network_utils.dart';

class SearchAddressManualScreen extends StatefulWidget {
  static const String routeName = '/search-address-manual-screen';
  final LatLng? initialLatLng;
  final Function(Address) changeAddress;

  const SearchAddressManualScreen({
    Key? key,
    required this.changeAddress,
    this.initialLatLng,
  }) : super(key: key);

  @override
  State<SearchAddressManualScreen> createState() =>
      _SearchAddressManualScreenState();
}

class _SearchAddressManualScreenState extends State<SearchAddressManualScreen> {
  final MapController mapController = MapController();
  LatLng latLng = LatLng(30.044420, 31.235712); // Cairo's coordinates
  final TextEditingController searchController = TextEditingController();
  Timer? searchOnStoppedTyping;
  List<Suggestion> searchSuggestion = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialLatLng != null) {
      latLng = widget.initialLatLng!;
    }
  }

  void _onTapMap(TapPosition tapPosition, LatLng point) {
    setState(() {
      latLng = point;
    });
    _updateAddress(point);
  }

  Future<void> _updateAddress(LatLng point) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(point.latitude, point.longitude);
    if (placemarks.isNotEmpty) {
      Address address = Address(
        area: placemarks.first.administrativeArea ?? "",
        street: placemarks.first.street ?? '',
        houseNumber: placemarks.first.locality ?? '',
        province: placemarks.first.country ?? '',
        latitude: point.latitude,
        longitude: point.longitude,
        floor: placemarks.first.name ?? "",
      );
      widget.changeAddress(address);
    }
  }

  void _onSearchChanged(String query) {
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping!.cancel();
    }
    searchOnStoppedTyping = Timer(Duration(milliseconds: 300), () {
      _searchLocation(query);
    });
  }

  Future<void> _searchLocation(String query) async {
    List<Location> locations = await locationFromAddress(query);
    if (locations.isNotEmpty) {
      LatLng newLatLng =
          LatLng(locations.first.latitude, locations.first.longitude);
      mapController.move(newLatLng, 13.0);
      setState(() {
        latLng = newLatLng;
      });
      _updateAddress(newLatLng);
    }
  }

  Future<void> getPlaceDetail(String placeId) async {
    final lp = context.read<LocationProvider>();

    LatLng latLng = await NetworkUtils().getPlaceDetailFromId(placeId);
    mapController.move(latLng, 17.0);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    if (placemarks.isNotEmpty) {
      searchSuggestion = [];

      await lp.setLocationManually(latLng);
      await lp.getPlacemarks();

      searchController.text = lp.address!.street.isNotEmpty
          ? '${lp.address!.street}, ${lp.address!.province}'
          : lp.address!.province;
      FocusScope.of(context).requestFocus(FocusNode());
      setState(() {});
    }
  }

  Future<void> getLocation() async {
    final lp = context.read<LocationProvider>();
    await lp.getCurrentLocation();
    await lp.getPlacemarks();
    if (lp.latitude != null && lp.longitude != null) {
      widget.changeAddress(lp.address!);
      mapController.move(
        LatLng(lp.address!.latitude, lp.address!.longitude),
        17.0,
      );
      // Navigator.pop(context);
    }
    // setState(() {});
  }

  void onSubmit() async {
    final currentLatLng = mapController.center;
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLatLng.latitude, currentLatLng.longitude);
    if (placemarks.isNotEmpty) {
      Address address = Address(
        area: placemarks.first.administrativeArea ?? "",
        street: placemarks.first.street ?? '',
        houseNumber: placemarks.first.locality ?? '',
        province: placemarks.first.country ?? '',
        latitude: currentLatLng.latitude,
        longitude: currentLatLng.longitude,
        floor: placemarks.first.name ?? "",
      );
      widget.changeAddress(address);
      // Optionally navigate back or show a confirmation message
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: scheme.primary,
        elevation: 0.5,
        title: Container(
          alignment: Alignment.center,
          height: 40,
          child: TextField(
            controller: searchController,
            minLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            onChanged: _onSearchChanged,
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.grey[100],
              hintText: 'Set delivery address',
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              contentPadding: const EdgeInsets.only(
                bottom: 10,
                left: 15,
                right: 15,
              ),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (searchController.text.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          searchController.text = '';
                        });
                      },
                      child: Icon(
                        Icons.highlight_remove_rounded,
                        color: Colors.grey[600],
                        size: 20,
                      ),
                    ),
                  const SizedBox(width: 10),
                  // GestureDetector(
                  //   onTap: getLocation,
                  //   child: Icon(
                  //     Icons.gps_fixed_outlined,
                  //     color: scheme.primary,
                  //     size: 20,
                  //   ),
                  // ),
                  // const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: widget.initialLatLng ?? latLng,
              initialZoom: 13.0,
              onTap: _onTapMap,
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
                    point: latLng,
                    width: 30,
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                  // Marker(
                  //   point: latLng,
                  //   builder: (ctx) => Icon(
                  //     Icons.location_on,
                  //     color: Colors.red,
                  //     size: 30,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          if (searchSuggestion.isNotEmpty)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.29,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      searchSuggestion.length < 5 ? searchSuggestion.length : 5,
                  itemBuilder: (context, index) {
                    final suggestion = searchSuggestion[index];
                    return GestureDetector(
                      onTap: () => getPlaceDetail(suggestion.placeId),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                '${suggestion.mainText}, ${suggestion.secondaryText.replaceAll(', Cambodia', '')}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          Positioned(
            right: 20,
            // left: 0,
            bottom: 120,
            child: GestureDetector(
              onTap: getLocation,
              child: Icon(
                Icons.gps_fixed_outlined,
                color: scheme.primary,
                size: 40,
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 30,
            child: CustomTextButton(
              text: 'Confirm',
              onPressed: onSubmit,
              isDisabled: false,
            ),
          ),
        ],
      ),
    );
  }
}
