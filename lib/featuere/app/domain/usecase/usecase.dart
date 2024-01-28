import 'package:dartz/dartz.dart';
import 'package:taskkafille/core/params/params.dart';
import 'package:taskkafille/featuere/app/data/model/get_dependansi_model/get_dependansi_model.dart';

import '../../../../core/errors/faliuar.dart';
import '../repo/get_dependansi_repo.dart';

class GetDependasiUseCase extends UseCase<GetDependansiModel, NoParams> 
{
  final GetDependansiRepo getDependansiRepo;

  GetDependasiUseCase({required this.getDependansiRepo});

  @override
  Future<Either<Failure, GetDependansiModel>> call(NoParams params) async 
  {
    return await getDependansiRepo.getDependansi();
  }
}