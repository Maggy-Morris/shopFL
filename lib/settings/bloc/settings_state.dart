part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final Submission submission;
  final String userName;
  final String password;
  final String fetchedPassword;
  final String newPassword;
  final String confirmNewPassword;

  final String language;

  final bool changePassword;

  const SettingsState({
    this.fetchedPassword = '',
    this.confirmNewPassword = '',
    this.language = '',
    this.submission = Submission.initial,
    this.userName = '',
    this.password = '',
    this.newPassword = '',
    this.changePassword = false,
  });

  SettingsState copyWith({
    String? fetchedPassword,
    String? confirmNewPassword,
    Submission? submission,
    String? userName,
    String? password,
    String? language,
    String? newPassword,
    bool? changePassword,
  }) {
    return SettingsState(
      fetchedPassword: fetchedPassword ?? this.fetchedPassword,
      confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
      language: language ?? this.language,
      submission: submission ?? this.submission,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      newPassword: newPassword ?? this.newPassword,
      changePassword: changePassword ?? this.changePassword,
    );
  }

  @override
  List<Object?> get props => [
        fetchedPassword,
        confirmNewPassword,
        language,
        submission,
        userName,
        password,
        newPassword,
        changePassword,
      ];
}
