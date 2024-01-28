import 'package:dartz/dartz.dart';
import 'package:taskkafille/core/params/params.dart';

import '../../../../core/errors/faliuar.dart';
import '../../../Auth/login/data/model/login_model/user_info_model.dart';
import '../../data/model/country_model/country_model.dart';
import '../base_repo/country_repo.dart';

class CountryUseCase extends UseCase<CountryModel, int> {
  final CountryRepo countryRepo;

  CountryUseCase({required this.countryRepo});

  @override
  Future<Either<Failure, CountryModel>> call(int page) async 
  {
    return await countryRepo.getCountry(page);
  }
}