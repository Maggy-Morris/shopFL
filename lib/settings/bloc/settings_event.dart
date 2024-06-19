part of 'settings_bloc.dart';

class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class EditUserName extends SettingsEvent {
  final String userName;
  const EditUserName({required this.userName});

  @override
  List<Object> get props => [userName];
}

class EditPassword extends SettingsEvent {
  final String password;
  const EditPassword({required this.password});

  @override
  List<Object> get props => [password];
}

class EditNewPassword extends SettingsEvent {
  final String newPassword;
  const EditNewPassword({required this.newPassword});

  @override
  List<Object> get props => [newPassword];
}




class ChangePassword extends SettingsEvent {
  final bool changePassword;
  const ChangePassword({required this.changePassword});

  @override
  List<Object> get props => [changePassword];
}


class EditLangueage extends SettingsEvent {
  final String language;
  const EditLangueage({required this.language});

  @override
  List<Object> get props => [language];
}
