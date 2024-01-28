import 'package:dartz/dartz.dart';
import 'package:taskkafille/core/errors/faliuar.dart';
import 'package:taskkafille/featuere/services_screen/data/model/service_model/service_model.dart';
import 'package:taskkafille/featuere/services_screen/domain/repo/service_repo.dart';

import '../datasource/remote/service_data_source_remote.dart';

class ServiceRepoImpl extends ServiceRepo
{
  final ServiceDataSourceRemote serviceDataSourceRemote;
  ServiceRepoImpl(this.serviceDataSourceRemote);

  @override
  Future<Either<Failure, ServiceModel>> getPopularService() {
    // TODO: implement getPopularService
    return serviceDataSourceRemote.getPopularSerice();
  }

  @override
  Future<Either<Failure, ServiceModel>> getService() {
    return serviceDataSourceRemote.getService();
  }

  }