import 'package:dartz/dartz.dart';

import '../../../../core/errors/faliuar.dart';
import '../../domain/repo/get_dependansi_repo.dart';
import '../data_source/remote/app_info_data_souce.dart';
import '../model/get_dependansi_model/get_dependansi_model.dart';

class GetDependansiRepoImpl extends GetDependansiRepo
{
  final GetDependansiRemoteDataSource getDependansiRemoteDataSource;

  GetDependansiRepoImpl({required this.getDependansiRemoteDataSource});

  @override
  Future<Either<Failure, GetDependansiModel>> getDependansi() async 
  {
    return await getDependansiRemoteDataSource.getDependansi();
  }
}