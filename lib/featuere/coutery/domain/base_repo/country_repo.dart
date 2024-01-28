import 'package:dartz/dartz.dart';

import '../../../../core/errors/faliuar.dart';
import '../../data/model/country_model/country_model.dart';

abstract class CountryRepo 
{
  Future<Either<Failure, CountryModel>> getCountry(int page);
}
