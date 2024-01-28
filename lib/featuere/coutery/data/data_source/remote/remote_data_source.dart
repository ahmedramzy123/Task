import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taskkafille/core/api/dio-helper.dart';
import 'package:taskkafille/core/api/end_points.dart';
import 'package:taskkafille/featuere/Auth/login/data/model/login_model/user_info_model.dart';

import '../../../../../core/errors/faliuar.dart';
import '../../model/country_model/country_model.dart';

abstract class RemoteCountryDataSource 
{
  Future<Either<Failure, CountryModel>> getCountry(int page);
}
class RemoteCountryDataSourceImpl extends RemoteCountryDataSource {
  @override
  Future<Either<Failure, CountryModel>> 
   getCountry(int page) 
 async {
    try
    {
      Response response = await DioHelper.
      getData(url: '${EndPoints.country}?page=$page');
      return Right(CountryModel.fromJson(response.data));
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