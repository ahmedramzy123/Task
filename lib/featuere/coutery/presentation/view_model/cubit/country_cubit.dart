import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskkafille/core/params/params.dart';

import '../../../data/model/country_model/country_model.dart';
import '../../../domain/use_case/usecase.dart';


part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryUseCase countryUseCase;
  CountryCubit(this.countryUseCase) : super(CountryStateInitial());
  static CountryCubit get(context) => BlocProvider.of(context);

  // ServiceModel? serviceModel;
  // Future<void> getServices() async {
  //
  //  emit(GetServicesLoading());
  //   final response = await serviceUseCase.callGetService(NoParams ());
  //   response.fold((l) {
  //     emit(GetServicesFailure(message: l.toString()));
  //   }, (r)
  //   {
  //     serviceModel= r;
  //     emit(GetServicesSuccess(serviceModel: r));
  //   });
  //
  // }
  //
  //
  //
  // ServiceModel? popularServiceModel;
  //
  // Future<void> getPopularServices() async {
  //
  //   emit(GetPopularServicesLoading());
  //   final response = await serviceUseCase.call(NoParams ());
  //   response.fold((l) {
  //     emit(GetPopularServicesFailure(message: l.toString()));
  //   }, (r)
  //   {
  //     popularServiceModel= r;
  //     emit(GetPopularServicesSuccess(serviceModel: r));
  //   });
  //
  // }

  CountryModel? countryModel;
Future<void> getCountry(int page) async {

  emit(GetCountryLoading());
  final response = await countryUseCase.call(page);
  response.fold((l) {
    emit(GetCountryFailure(message: l.toString()));
  }, (r)
  {
     countryModel= r;
    emit(GetCountrySuccess(countryModel: r));
  });
}}
