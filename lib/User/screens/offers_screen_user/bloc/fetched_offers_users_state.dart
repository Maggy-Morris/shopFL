part of 'fetched_offers_users_bloc.dart';

sealed class FetchedOffersUsersState extends Equatable {
  const FetchedOffersUsersState();
  
  @override
  List<Object> get props => [];
}

final class FetchedOffersUsersInitial extends FetchedOffersUsersState {}
