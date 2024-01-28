import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taskkafille/core/api/dio-helper.dart';
import 'package:taskkafille/core/api/end_points.dart';
import 'package:taskkafille/core/errors/faliuar.dart';
import 'package:taskkafille/core/params/params.dart';
import 'package:taskkafille/featuere/Auth/login/data/model/login_model/login_model.dart';

abstract class LoginDataSource
{
  Future<Either<Failure , LoginModel>> loginDataSource(LoginParams loginParams);
}

class LoginDataSourceImpl extends LoginDataSource
{
  @override
  Future<Either<Failure, LoginModel>>
  loginDataSource(LoginParams loginParams)
  async
  {
    try
    {
      final Response response = await DioHelper.
      postData
          (url: EndPoints.signInEndPoint,

          data: loginParams.toMap());
      return Right(LoginModel.fromJson(response.data));
    }
    on DioException catch(e)
    {
      return Left(ServerFailure.fromDioError(e));
    } catch(e)
    {
      print(e.toString());
      return Left(FailureLocal(message: e.toString()));
    }
  }

}