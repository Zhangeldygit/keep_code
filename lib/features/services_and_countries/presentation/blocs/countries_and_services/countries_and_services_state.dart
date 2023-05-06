part of 'countries_and_services_bloc.dart';

abstract class CountriesAndServicesState extends Equatable {
  const CountriesAndServicesState();

  @override
  List<Object> get props => [];
}

class CountriesAndServicesInitial extends CountriesAndServicesState {
  @override
  List<Object> get props => [];
}

class CountriesAndServicesLoading extends CountriesAndServicesState {
  @override
  List<Object> get props => [];
}

class CountriesAndServicesSuccess extends CountriesAndServicesState {
  final CountriesAndServicesModel data;

  const CountriesAndServicesSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

class CountriesAndServicesError extends CountriesAndServicesState {
  final String error;

  const CountriesAndServicesError({required this.error});
  @override
  List<Object> get props => [error];
}
