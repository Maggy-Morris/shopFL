import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../user_repo.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationUserBloc
    extends Bloc<AuthenticationEvent, AuthenticationUserState> {
  final UserRepo userRepo;
  late StreamSubscription<User?> _userSubscription;

  AuthenticationUserBloc({required this.userRepo})
      : super(const AuthenticationUserState.unknown()) {
    _userSubscription = userRepo.user.listen((user) {
      add(AuthenticationUserChanged(user: user));
    });
    on<AuthenticationUserChanged>((event, emit) {
      if (event.user != null) {
        emit(AuthenticationUserState.authenticated(event.user!));
      } else {
        emit(const AuthenticationUserState.unauthenticated());
      }
    });
  }
  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
