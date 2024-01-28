import 'package:dartz/dartz.dart';

import '../../../../../core/errors/faliuar.dart';
import '../../../../../core/params/params.dart';
import '../../../login/data/model/login_model/login_model.dart';

abstract class RegisterRepo 
{
  Future<Either<Failure, LoginModel>> 
  register(RegisterParams params);
}

