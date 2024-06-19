part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final Submission submission;
  final String userName;
  final String password;
  final String newPassword;
  final String language;

  final bool changePassword;

  const SettingsState({
    this.language = '',
    this.submission = Submission.initial,
    this.userName = '',
    this.password = '',
    this.newPassword = '',
    this.changePassword = false,
  });

  SettingsState copyWith({
    Submission? submission,
    String? userName,
    String? password,
    String? language,
    String? newPassword,
    bool? changePassword,
  }) {
    return SettingsState(
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
        language,
        submission,
        userName,
        password,
        newPassword,
        changePassword,
      ];
}
