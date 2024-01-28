import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taskkafille/core/api/dio-helper.dart';
import 'package:taskkafille/core/api/end_points.dart';
import 'package:taskkafille/core/errors/faliuar.dart';
import 'package:taskkafille/featuere/app/data/model/get_dependansi_model/get_dependansi_model.dart';

abstract class GetDependansiRemoteDataSource
{
  Future<Either<Failure,GetDependansiModel>> getDependansi();
}

class GetDependansiRemoteDataSourceImpl extends GetDependansiRemoteDataSource
{
  @override
  Future<Either<Failure, GetDependansiModel>> getDependansi() 
 async 
  {
    try
    {
      final Response response =  await DioHelper.getData(url: EndPoints.GET_DEPENDANCI_END_POINT); 
      return Right(GetDependansiModel.fromJson(response.data));
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