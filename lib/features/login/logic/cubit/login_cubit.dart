import 'package:flutter/material.dart';
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
    emit(const LoginState.loading());
    final response = await _loginRepo.login(LoginRequestBody(
      password: passwordController.text,
      email: emailController.text));
    response.when(success: (loginResponse) {
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
