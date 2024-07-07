import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import '../models/map_marker_model.dart';
part 'map_marker_state.dart';

class MapMarkerCubit extends Cubit<MapMarkerState> {
  MapMarkerCubit() : super(const MapMarkerState());
  Position? _currentPosition;
  void fetchMarkers() async {
    emit(state.copyWith(state: MapMarkerStatus.loading));
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final ref = firestore.collection('offers');

      final snapshot = await ref.get();
      final List<MapMarkerModel> markers = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return MapMarkerModel(
          id: doc.id,
          name: data['shopName'] ?? 'No name',
          description: data['description'] ?? 'No description',

          // discount: data['discount'],

          // position: LatLng(
          //   map['position']['latitude'],
          //   map['position']['longitude'],
          // ),
          currency: data['currency'],
          discountPercentageFrom: data['discountPercentageFrom'],
          discountPercentageTo: data['discountPercentageTo'],
          discountPercentage: data['discountPercentage'],
          endOfferDate: data['endOfferDate'],

          latitude: data['latitude'],
          longitude: data['longitude'],
          offerImage: data['offerImage'],
          offersDuration: data['offersDuration'],
          originalPrice: data['originalPrice'],
          priceAfterDiscount: data['priceAfterDiscount'],
          sellerUid: data['sellerUid'],
          shopImageUrl: data['shopImageUrl'],
          shopName: data['shopName'],
          showOffersDisplay: data['showOffersDisplay'],
          startOffersDate: data['startOffersDate'],

          // position: LatLng(data['latitude'] ?? 0.0, data['longitude'] ?? 0.0),
        );
      }).toList();

      emit(state.copyWith(state: MapMarkerStatus.loaded, markers: markers));
    } catch (e) {
      emit(state.copyWith(
          state: MapMarkerStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _currentPosition = position;

      if (_currentPosition != null) {
        emit(state.copyWith(
          currentLocation:
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          locationFetched: true,
        ));
      } else {
        emit(state.copyWith(errorMessage: "Failed to fetch current location"));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> getAddressFromLatLng() async {
    emit(state.copyWith(state: MapMarkerStatus.loading));
    if (_currentPosition == null) {
      emit(state.copyWith(errorMessage: "Current position is null"));
      return;
    }
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);
      if (placeMarks.isNotEmpty) {
        Placemark place = placeMarks[0];
        emit(state.copyWith(
          currentLocationName:
              "${place.street}-${place.administrativeArea}-${place.country}",
        ));
      } else {
        emit(state.copyWith(errorMessage: ""));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  // void selectMarker(MapMarkerModel marker) {
  //   emit(state.copyWith(isMarkerSelected: marker));
  //
  // }
}
