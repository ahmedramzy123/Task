import 'package:dartz/dartz.dart';
import 'package:taskkafille/featuere/app/data/model/get_dependansi_model/get_dependansi_model.dart';

import '../../../../core/errors/faliuar.dart';

abstract class GetDependansiRepo 
{
  Future<Either<Failure, GetDependansiModel>> getDependansi();
}