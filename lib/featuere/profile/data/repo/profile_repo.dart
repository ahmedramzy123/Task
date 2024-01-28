import 'package:dartz/dartz.dart';

import '../../../../core/errors/faliuar.dart';
import '../../../Auth/login/data/model/login_model/user_info_model.dart';
import '../../domain/base_repo/profile_repo.dart';
import '../data_source/remote/remote_data_source.dart';

class ProfileRepoImpl extends ProfileRepo
 {
  final RemoteProfileDataSource profileDataSource;

  ProfileRepoImpl({required this.profileDataSource});

  @override
  Future<Either<Failure, UserInfoModel>> getProfile() async {
    return await profileDataSource.getProfile();
  }
}