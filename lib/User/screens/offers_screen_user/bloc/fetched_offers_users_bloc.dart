import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'fetched_offers_users_event.dart';
part 'fetched_offers_users_state.dart';

class FetchedOffersUsersBloc
    extends Bloc<FetchedOffersUsersEvent, FetchedOffersUsersState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  FetchedOffersUsersBloc() : super(FetchedOffersUsersInitial()) {
    on<FetchedOffersUsersEvent>((event, emit) {});
  }

  // Function to fetch all offers for all sellers
  Future<List<Map<String, dynamic>>> fetchAllOffers() async {
    final snapshot = await firestore.collection('offers').get();
    final List<Map<String, dynamic>> offers = [];

    for (var doc in snapshot.docs) {
      offers.add(doc.data());
    }

    return offers;
  }
}
