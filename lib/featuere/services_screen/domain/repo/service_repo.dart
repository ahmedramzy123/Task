import 'package:dartz/dartz.dart';

import '../../../../core/errors/faliuar.dart';
import '../../data/model/service_model/service_model.dart';

abstract class ServiceRepo
{
  Future<Either<Failure, ServiceModel>> getService();
   Future<Either<Failure, ServiceModel>> getPopularService();
}
