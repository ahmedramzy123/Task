part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}
final class LoginChangeObSecureStates extends RegisterState {}
final class RegisterSwitchStepOne extends RegisterState {}
final class RegisterChangeCounte extends RegisterState {}
