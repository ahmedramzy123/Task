import 'package:dartz/dartz.dart';

import '../../../../core/errors/faliuar.dart';
import '../../../../core/params/params.dart';
import '../../data/model/service_model/service_model.dart';
import '../repo/service_repo.dart';

class ServiceUseCase  extends UseCase<ServiceModel,NoParams>
{
  final ServiceRepo serviceRepo;
  ServiceUseCase({
    required this.serviceRepo
  });
  @override
  Future<Either<Failure, ServiceModel>> callGetService(NoParams noParams)
  {
    return serviceRepo.getService();
  }

  @override
  Future<Either<Failure, ServiceModel>> call(NoParams params) {
    return serviceRepo.getPopularService();
  }


}