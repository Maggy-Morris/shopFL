part of 'user_profile_bloc.dart';

class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class EditUserName extends UserProfileEvent {
  final String userName;
  const EditUserName({required this.userName});

  @override
  List<Object> get props => [userName];
}

class EditPassword extends UserProfileEvent {
  final String password;
  const EditPassword({required this.password});

  @override
  List<Object> get props => [password];
}

class EditNewPassword extends UserProfileEvent {
  final String newPassword;
  const EditNewPassword({required this.newPassword});

  @override
  List<Object> get props => [newPassword];
}

class EditConfirmNewPassword extends UserProfileEvent {
  final String confirmNewPassword;
  const EditConfirmNewPassword({required this.confirmNewPassword});

  @override
  List<Object> get props => [confirmNewPassword];
}

class FetchUserData extends UserProfileEvent {
  const FetchUserData();

  @override
  List<Object> get props => [];
}


class UpdateUserData extends UserProfileEvent {


  const UpdateUserData();

  @override
  List<Object> get props => [];
}




class ChangePassword extends UserProfileEvent {
  final bool changePassword;
  const ChangePassword({required this.changePassword});

  @override
  List<Object> get props => [changePassword];
}


class EditLangueage extends UserProfileEvent {
  final String language;
  const EditLangueage({required this.language});

  @override
  List<Object> get props => [language];
}
