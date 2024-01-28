import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskkafille/featuere/Auth/register/domain/use_case/use_case_register.dart';

import '../../../../../app/domain/usecase/usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> 
{
  RegisterUseCase registerUseCase;
  GetDependasiUseCase getDependasiUseCase;
  RegisterCubit(
    this.registerUseCase , 
  this.getDependasiUseCase
  ) : super(RegisterInitial());
  static RegisterCubit get(context)=> BlocProvider.of(context);
  bool stepOne = false;
  bool steTwo = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var firstname = TextEditingController();
  var lastName = TextEditingController();
    var email = TextEditingController();

  var about = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  int? typeUser;

  bool obSecure = true;
  Icon icon =   const Icon(Icons.visibility_outlined);
  void changeObSecurePassword() {
    obSecure = !obSecure;
    obSecure? icon = const Icon(Icons.visibility_outlined):icon = const Icon(Icons.visibility_off_outlined);
    emit(LoginChangeObSecureStates());
  }
  Future<void> gtAppDependanci()
  async
  {

  }


  void switchStepOne()
  {

    print("Amr Amr");
    stepOne = !stepOne;
    print(stepOne);
    emit(RegisterSwitchStepOne());
  }

  int count = 0;
  void addCount()
  {
    count++;
    print(count);
    emit(RegisterChangeCounte());
  }
  void minesCount()
  {
    if(count>0)
    {
      count--;
      print(count);
      emit(RegisterChangeCounte());
    }
  }



}
