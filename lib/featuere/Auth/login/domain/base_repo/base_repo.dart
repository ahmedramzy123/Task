import 'package:dartz/dartz.dart';

import '../../../../../core/errors/faliuar.dart';
import '../../../../../core/params/params.dart';
import '../../data/model/login_model/login_model.dart';

abstract class LoginRepo
{
  Future<Either<Failure , LoginModel>> login(LoginParams loginParams);
}