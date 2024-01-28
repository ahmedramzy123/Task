import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taskkafille/core/api/dio-helper.dart';
import 'package:taskkafille/core/api/end_points.dart';
import 'package:taskkafille/featuere/Auth/login/data/model/login_model/user_info_model.dart';

import '../../../../../core/errors/faliuar.dart';

abstract class RemoteProfileDataSource {
  Future<Either<Failure, UserInfoModel>> getProfile();
}
class RemoteProfileDataSourceImpl extends RemoteProfileDataSource {
  @override
  Future<Either<Failure, UserInfoModel>> getProfile() 
 async {
    try
    {
      Response response = await DioHelper.getData(url: EndPoints.profile);
      return Right(UserInfoModel.fromJson(response.data['data']));
    }
    on DioException catch(e)
    {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) 
    {
      return Left(FailureLocal(message: e.toString()));
    }

  }
}