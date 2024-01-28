import 'package:dartz/dartz.dart';

import '../../../../../core/errors/faliuar.dart';
import '../../../../../core/params/params.dart';
import '../../data/model/login_model/login_model.dart';
import '../base_repo/base_repo.dart';

class LoginUserCase  extends UseCase<LoginModel,LoginParams>
{
  final LoginRepo loginRepo;
  LoginUserCase({
    required this.loginRepo
  });
  @override
  Future<Either<Failure, LoginModel>> call(LoginParams params)
  {
   return loginRepo.login(params);
  }


}