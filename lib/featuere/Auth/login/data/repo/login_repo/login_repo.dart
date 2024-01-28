import 'package:dartz/dartz.dart';
import 'package:taskkafille/core/errors/faliuar.dart';
import 'package:taskkafille/core/params/params.dart';
import 'package:taskkafille/featuere/Auth/login/data/data_source/remote/login_data_source.dart';

import '../../../domain/base_repo/base_repo.dart';
import '../../model/login_model/login_model.dart';


class LoginRepImpl extends LoginRepo
{
  final LoginDataSource loginDataSource;
  LoginRepImpl(this.loginDataSource);
  @override
  Future<Either<Failure, LoginModel>>
  login(LoginParams loginParams)
  async
  {
    return loginDataSource.loginDataSource(loginParams);
  }

}