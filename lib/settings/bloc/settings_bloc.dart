import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/enum/enum.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  static SettingsBloc get(context) => BlocProvider.of<SettingsBloc>(context);
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsEvent>((event, emit) {});

    on<EditUserName>(_onEditUserName);
    on<EditPassword>(_onEditPassword);
    on<EditNewPassword>(_onEditNewPassword);

    on<ChangePassword>(_onChangePassword);
    on<EditLangueage>(_onEditLangueage);
  }

  _onEditLangueage(EditLangueage event, Emitter<SettingsState> emit) {
    emit(state.copyWith(
        language: event.language, submission: Submission.editing));
  }

  _onChangePassword(ChangePassword event, Emitter<SettingsState> emit) {
    emit(state.copyWith(
        changePassword: event.changePassword, submission: Submission.editing));
  }

  _onEditUserName(EditUserName event, Emitter<SettingsState> emit) {
    emit(state.copyWith(
        userName: event.userName, submission: Submission.editing));
  }

  _onEditPassword(EditPassword event, Emitter<SettingsState> emit) {
    emit(state.copyWith(
        password: event.password, submission: Submission.editing));
  }

  _onEditNewPassword(EditNewPassword event, Emitter<SettingsState> emit) {
    emit(state.copyWith(
        newPassword: event.newPassword, submission: Submission.editing));
  }
}
