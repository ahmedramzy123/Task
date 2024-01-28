import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taskkafille/core/api/dio-helper.dart';
import 'package:taskkafille/featuere/Auth/login/data/model/login_model/login_model.dart';

import '../../../../../../core/api/end_points.dart';
import '../../../../../../core/errors/faliuar.dart';
import '../../../../../../core/params/params.dart';

abstract class RegisterDataSource
{
  Future<Either<Failure,LoginModel>> register(RegisterParams params);
}
class RegisterDataSourceImpl extends RegisterDataSource
{
  @override
  Future<Either<Failure, LoginModel>> 
  register(RegisterParams params) 
  async 
  {
    try
    {
      Response response = await DioHelper.postData
      (url: EndPoints.signUpEndPoint, 
      data: params.formData()
      );
      return Right(LoginModel.fromJson(response.data));
    } on DioException catch (e) 
    {
      return Left(ServerFailure.fromDioError(e));
      // TODO
    } catch (e) 
    {
      return Left(FailureLocal(message: e.toString()));
      // TODO
    }
  }

}