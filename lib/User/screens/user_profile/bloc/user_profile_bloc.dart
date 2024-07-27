import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/enum/enum.dart';
import '../user_profile_provider.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  static UserProfileBloc get(context) =>
      BlocProvider.of<UserProfileBloc>(context);
  UserProfileBloc() : super(const UserProfileState()) {
    on<UserProfileEvent>((event, emit) {});

    on<EditUserName>(_onEditUserName);
    on<EditPassword>(_onEditPassword);
    on<EditNewPassword>(_onEditNewPassword);
    on<EditConfirmNewPassword>(_onEditConfirmNewPassword);

    on<ChangePassword>(_onChangePassword);
    on<EditLangueage>(_onEditLangueage);
    on<FetchUserData>(_onFetchUserData);
    on<UpdateUserData>(_onUpdateUserData);
  }

  _onEditLangueage(EditLangueage event, Emitter<UserProfileState> emit) {
   

    emit(state.copyWith(
        language: event.language, submission: Submission.editing));
  }

  

// void changeLanguage(BuildContext context, String languageCode) {
//   EasyLocalization.of(context)!.setLocale(Locale(languageCode));
// }

  _onChangePassword(ChangePassword event, Emitter<UserProfileState> emit) {
    emit(state.copyWith(
        changePassword: event.changePassword, submission: Submission.editing));
  }

  _onEditUserName(EditUserName event, Emitter<UserProfileState> emit) {
    emit(state.copyWith(
        userName: event.userName, submission: Submission.editing));
  }

  _onEditPassword(EditPassword event, Emitter<UserProfileState> emit) {
    emit(state.copyWith(
        password: event.password, submission: Submission.editing));
  }

  _onEditConfirmNewPassword(
      EditConfirmNewPassword event, Emitter<UserProfileState> emit) {
    emit(state.copyWith(
        confirmNewPassword: event.confirmNewPassword,
        submission: Submission.editing));
  }

  _onEditNewPassword(EditNewPassword event, Emitter<UserProfileState> emit) {
    emit(state.copyWith(
        newPassword: event.newPassword, submission: Submission.editing));
  }

  _onFetchUserData(FetchUserData event, Emitter<UserProfileState> emit) async {
    emit(state.copyWith(submission: Submission.loading));

    try {
      // final RegisterShopProvider registerShopProvider;

      // final rp = context.read<RegisterShopProvider>();
      final result = await UserProvider().checkIfUserExist();

      if (result.userName != "") {
        emit(state.copyWith(
          submission: Submission.success,
          userName: result.userName,
          fetchedPassword: result.userPassword,
        ));
      } else {
        emit(state.copyWith(submission: Submission.noDataFound));
      }
    } catch (e) {
      emit(state.copyWith(submission: Submission.error));
      debugPrint("Error fetching shop info: $e");
    }
  }

  _onUpdateUserData(
      UpdateUserData event, Emitter<UserProfileState> emit) async {
    emit(state.copyWith(submission: Submission.loading));

    await UserProvider().updateUserData(
        userName: state.userName, newUserPassword: state.newPassword);

    // if (result.isRegistered) {
    emit(state.copyWith(
        submission: Submission.success,
        userName: state.userName,
        password: state.password));
    // } else {
    //   emit(state.copyWith(submission: Submission.noDataFound));
    // }
  }
}
