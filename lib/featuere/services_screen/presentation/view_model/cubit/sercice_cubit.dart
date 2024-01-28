import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskkafille/core/params/params.dart';

import '../../../data/model/service_model/service_model.dart';
import '../../../domain/repo/service_repo.dart';
import '../../../domain/usecase/usecase.dart';

part 'sercice_state.dart';

class ServiceCubit extends Cubit<SerciceState> {
  ServiceUseCase serviceUseCase;
  ServiceCubit(this.serviceUseCase) : super(SerciceInitial());
  static ServiceCubit get(context) => BlocProvider.of(context);

  ServiceModel? serviceModel;
  Future<void> getServices() async {

   emit(GetServicesLoading());
    final response = await serviceUseCase.callGetService(NoParams ());
    response.fold((l) {
      emit(GetServicesFailure(message: l.toString()));
    }, (r)
    {
      serviceModel= r;
      emit(GetServicesSuccess(serviceModel: r));
    });

  }



  ServiceModel? popularServiceModel;

  Future<void> getPopularServices() async {

    emit(GetPopularServicesLoading());
    final response = await serviceUseCase.call(NoParams ());
    response.fold((l) {
      emit(GetPopularServicesFailure(message: l.toString()));
    }, (r)
    {
      popularServiceModel= r;
      emit(GetPopularServicesSuccess(serviceModel: r));
    });

  }
}
