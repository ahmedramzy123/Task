import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskkafille/featuere/Auth/login/presentation/widget/login_body.dart';
import 'package:taskkafille/featuere/Auth/login/view_model/cubit/auth_login.dart';

import '../../../../sl.dart';
import '../domain/use_case/login_use_case.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => LoginCubit(getIt<LoginUserCase>()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Row(
            children: [
              Icon(Icons.arrow_back_ios,color: Colors.black,),
              Text('Account Login ',style:
              TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),),
            ],
          )
        ),
        body:  LoginBody()
      ),
    );
  }
}
