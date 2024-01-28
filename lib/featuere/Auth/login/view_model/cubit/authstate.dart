import '../../data/model/login_model/login_model.dart';

class AuthState {}
class initialState extends AuthState {}



class LoginChangeObSecureStates extends AuthState {}
class LoginLoading extends AuthState {}

class LoginFailure extends AuthState {
  String message;
  LoginFailure({required this.message});
}

class LoginSuccess extends AuthState {
  LoginModel userModel;
  LoginSuccess({required this.userModel});
}

