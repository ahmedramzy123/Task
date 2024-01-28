import 'package:dartz/dartz.dart';
import 'package:taskkafille/core/params/params.dart';

import '../../../../core/errors/faliuar.dart';
import '../../../Auth/login/data/model/login_model/user_info_model.dart';
import '../base_repo/profile_repo.dart';

class ProfileUseCase extends UseCase<UserInfoModel, NoParams> {
  final ProfileRepo profileRepo;

  ProfileUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, UserInfoModel>> call(NoParams noParams) async 
  {
    return await profileRepo.getProfile();
  }
}