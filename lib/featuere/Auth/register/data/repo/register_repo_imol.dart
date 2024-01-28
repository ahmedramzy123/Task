import 'package:dartz/dartz.dart';
import 'package:taskkafille/featuere/Auth/register/data/datasource/remote/register_data_source.dart';

import '../../../../../core/errors/faliuar.dart';
import '../../../../../core/params/params.dart';
import '../../../login/data/model/login_model/login_model.dart';
import '../../domain/base_repo/base_repo_register.dart';
class BaseRegisterRepoImpl extends RegisterRepo 
{
  final RegisterDataSource registerDataSource;
  BaseRegisterRepoImpl(this.registerDataSource);
  @override
  Future<Either<Failure, LoginModel>>
   register(RegisterParams params) async 
  {
    return await registerDataSource.register(params);
  }
}