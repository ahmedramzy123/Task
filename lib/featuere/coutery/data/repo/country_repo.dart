import 'package:dartz/dartz.dart';

import '../../../../core/errors/faliuar.dart';
import '../../../Auth/login/data/model/login_model/user_info_model.dart';
import '../../domain/base_repo/country_repo.dart';
import '../data_source/remote/remote_data_source.dart';
import '../model/country_model/country_model.dart';

class CountryRepoImpl extends CountryRepo
 {
  final RemoteCountryDataSource profileCountryDataSource;

  CountryRepoImpl({required this.profileCountryDataSource});

  @override
  Future<Either<Failure, CountryModel>> getCountry(int page) async 
  {
    return await profileCountryDataSource.getCountry(page);
  }
  

}