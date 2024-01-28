import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/params/params.dart';
import '../../domain/use_case/login_use_case.dart';
import 'authstate.dart';

class LoginCubit extends  Cubit<AuthState> {
  LoginUserCase loginUserCase ;
  LoginCubit(this.loginUserCase) : super(initialState());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);


  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool obSecure = true;
  Icon icon =   const Icon(Icons.visibility_outlined);
  void changeObSecurePassword() {
    obSecure = !obSecure;
    obSecure? icon = const Icon(Icons.visibility_outlined):icon = const Icon(Icons.visibility_off_outlined);
    emit(LoginChangeObSecureStates());
  }






  void loginMethod() async {
    emit(LoginLoading());
    var result = await loginUserCase.call(
        LoginParams(email: emailController.text, password:passwordController.text));
    result.fold((l)
    {
      print(l.message);
      emit(LoginFailure(message: l.message));
    }, (r)
    {
      emit(LoginSuccess(userModel: r));
    });

  }





}