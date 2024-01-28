part of 'country_cubit.dart';

@immutable
abstract class CountryState {}

class CountryStateInitial extends CountryState {}
class GetCountryLoading extends CountryState {}
class GetCountrySuccess extends CountryState
{
  final CountryModel countryModel;

  GetCountrySuccess({required this.countryModel});
}
class GetCountryFailure extends CountryState
{
  final String message;

  GetCountryFailure({required this.message});
}


