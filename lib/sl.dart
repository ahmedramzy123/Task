import 'package:get_it/get_it.dart';
import 'package:taskkafille/featuere/Auth/login/view_model/cubit/auth_login.dart';
import 'package:taskkafille/featuere/Auth/register/data/datasource/remote/register_data_source.dart';
import 'package:taskkafille/featuere/Auth/register/data/repo/register_repo_imol.dart';
import 'package:taskkafille/featuere/Auth/register/domain/use_case/use_case_register.dart';
import 'package:taskkafille/featuere/Auth/register/presentaion/register_cubit/cubit/register_cubit.dart';
import 'package:taskkafille/featuere/app/data/data_source/remote/app_info_data_souce.dart';
import 'package:taskkafille/featuere/app/data/repo_impl/get_dependasi_repo_impl.dart';
import 'package:taskkafille/featuere/app/domain/usecase/usecase.dart';
import 'package:taskkafille/featuere/coutery/data/repo/country_repo.dart';
import 'package:taskkafille/featuere/coutery/domain/use_case/usecase.dart';
import 'package:taskkafille/featuere/coutery/presentation/view_model/cubit/country_cubit.dart';
import 'featuere/Auth/login/data/data_source/remote/login_data_source.dart';
import 'featuere/Auth/login/data/repo/login_repo/login_repo.dart';
import 'featuere/Auth/login/domain/use_case/login_use_case.dart';
import 'featuere/app/domain/repo/get_dependansi_repo.dart';
import 'featuere/coutery/data/data_source/remote/remote_data_source.dart';
import 'featuere/coutery/domain/base_repo/country_repo.dart';
import 'featuere/services_screen/data/datasource/remote/service_data_source_remote.dart';
import 'featuere/services_screen/data/repo/service_repo_impl.dart';
import 'featuere/services_screen/domain/repo/service_repo.dart';
import 'featuere/services_screen/domain/usecase/usecase.dart';
import 'featuere/services_screen/presentation/view_model/cubit/sercice_cubit.dart';

final getIt = GetIt.instance;
void setup() {
  // useCase

  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt<BaseRegisterRepoImpl>()));

  getIt.registerLazySingleton<LoginUserCase>(() => LoginUserCase( loginRepo: getIt<LoginRepImpl>()));

  getIt.registerLazySingleton<ServiceUseCase>(() => ServiceUseCase( serviceRepo:  getIt<ServiceRepoImpl>(), ));


  getIt.registerLazySingleton<CountryUseCase>(() => CountryUseCase(    countryRepo: getIt<CountryRepoImpl>(), ));

  getIt.registerLazySingleton<GetDependasiUseCase>(() => GetDependasiUseCase(    getDependansiRepo: getIt<GetDependansiRepo>(), ));





  // repo
  getIt.registerLazySingleton<BaseRegisterRepoImpl>(() => BaseRegisterRepoImpl(getIt<RegisterDataSourceImpl>()));

  getIt.registerLazySingleton<LoginRepImpl>(() => LoginRepImpl(getIt<LoginDataSourceImpl>()));


  getIt.registerLazySingleton<ServiceRepoImpl>(() => ServiceRepoImpl(getIt<ServiceDataSourceRemoteImpl>()));

  getIt.registerLazySingleton<CountryRepoImpl>(() => CountryRepoImpl( profileCountryDataSource: getIt<RemoteCountryDataSourceImpl>()));

    getIt.registerLazySingleton<GetDependansiRepo>(() => GetDependansiRepoImpl( getDependansiRemoteDataSource:  getIt<GetDependansiRemoteDataSourceImpl>(), ));





  // dataSource


  getIt.registerLazySingleton<RegisterDataSourceImpl>(() => RegisterDataSourceImpl());
  
    getIt.registerLazySingleton<GetDependansiRemoteDataSourceImpl>(() => GetDependansiRemoteDataSourceImpl());


  getIt.registerLazySingleton<LoginDataSourceImpl>(() => LoginDataSourceImpl());

  getIt.registerLazySingleton<ServiceDataSourceRemoteImpl>(() => ServiceDataSourceRemoteImpl());


  getIt.registerLazySingleton<RemoteCountryDataSourceImpl>(() => RemoteCountryDataSourceImpl());


  // cubit


  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt<RegisterUseCase>() , getIt<GetDependasiUseCase>()));


  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUserCase>()));


  getIt.registerFactory<ServiceCubit>(() => ServiceCubit(getIt<ServiceUseCase>()));

  getIt.registerFactory<CountryCubit>(() => CountryCubit(getIt<CountryUseCase>()));

}
