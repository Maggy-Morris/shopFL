part of 'authentication_bloc.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationUserState extends Equatable {

  final AuthenticationStatus status;
  final User? user;

  const AuthenticationUserState._({
    this.status = AuthenticationStatus.unknown,
     this.user,

  });

  const AuthenticationUserState.unknown() : this._();

  const AuthenticationUserState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationUserState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [status, user?? '' ];
}
