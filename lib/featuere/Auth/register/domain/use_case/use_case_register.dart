import 'package:dartz/dartz.dart';
import 'package:taskkafille/featuere/Auth/register/domain/base_repo/base_repo_register.dart';

import '../../../../../core/errors/faliuar.dart';
import '../../../../../core/params/params.dart';
import '../../../login/data/model/login_model/login_model.dart';

class RegisterUseCase extends UseCase<LoginModel, RegisterParams> 
{
  final RegisterRepo registerRepo;
  RegisterUseCase(this.registerRepo);
  @override
  Future<Either<Failure, LoginModel>> call(RegisterParams params) async 
  {
    return await registerRepo.register(params);
  }
}