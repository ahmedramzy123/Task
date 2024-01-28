import 'package:dartz/dartz.dart';

import '../../../../core/errors/faliuar.dart';
import '../../../Auth/login/data/model/login_model/user_info_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserInfoModel>> getProfile();
}