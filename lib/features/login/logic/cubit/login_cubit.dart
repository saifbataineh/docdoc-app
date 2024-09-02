import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/constants.dart';
import 'package:flutter_advanced/core/helpers/shared_pref_helper.dart';
import 'package:flutter_advanced/core/networking/dio_factory.dart';
import 'package:flutter_advanced/features/login/data/models/logic_request_body.dart';
import 'package:flutter_advanced/features/login/data/repos/login_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void emitLoginStates() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(LoginRequestBody(
        password: passwordController.text, email: emailController.text));
    response.when(success: (loginResponse) async {
      await saveUserToken(loginResponse.userData?.token ?? '');
      emit(LoginState.loginSuccess(loginResponse));
    }, failure: (apiErrormodel) {
      emit(LoginState.loginError(apiErrormodel));
    });
  }

  Future<void> saveUserToken(String token) async {
    //save token to shared preferences
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
