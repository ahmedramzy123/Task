part of 'sercice_cubit.dart';

@immutable
abstract class SerciceState {}

class SerciceInitial extends SerciceState {}



class GetServicesLoading extends SerciceState {}
class GetServicesSuccess extends SerciceState {
  final ServiceModel serviceModel;
  GetServicesSuccess({
    required this.serviceModel
  });
}
class GetServicesFailure extends SerciceState {
  final String message;
  GetServicesFailure({
    required this.message
  });
}



class GetPopularServicesLoading extends SerciceState {}
class GetPopularServicesSuccess extends SerciceState {
  final ServiceModel serviceModel;
  GetPopularServicesSuccess({
    required this.serviceModel
  });
}
class GetPopularServicesFailure extends SerciceState {
  final String message;
  GetPopularServicesFailure({
    required this.message
  });
}