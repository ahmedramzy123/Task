import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taskkafille/core/api/dio-helper.dart';
import 'package:taskkafille/core/errors/faliuar.dart';
import 'package:taskkafille/featuere/services_screen/data/model/service_model/service_model.dart';

import '../../../../../core/api/end_points.dart';

abstract class ServiceDataSourceRemote {
  Future<Either<Failure , ServiceModel >> getService();
  Future<Either<Failure , ServiceModel>> getPopularSerice();
}
class ServiceDataSourceRemoteImpl extends ServiceDataSourceRemote
{
  @override
  Future<Either<Failure, ServiceModel>> getPopularSerice() 
  async 
  {
    try
    {
      Response response = await DioHelper.
      getData
        (
          url:  EndPoints.getServicePopularEndPoint
        );

      return Right(ServiceModel.fromJson(response.data));
    }
    on DioException catch (e)
    {
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e)
    {
      return Left(FailureLocal(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, ServiceModel>> getService()
  async 
  {
    try
    {
      Response response = await DioHelper.
      getData
        (
          url:  EndPoints.getServiceEndPoint
        );

      return Right(ServiceModel.fromJson(response.data));
    }
    on DioException catch (e)
    {
      return Left(ServerFailure.fromDioError(e));
    }
    catch (e)
    {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}