part of 'countries_bloc.dart';

abstract class CountriesState extends Equatable {
  const CountriesState();

  @override
  List<Object> get props => [];
}

class CountriesInitial extends CountriesState {
  @override
  List<Object> get props => [];
}

class CountriesLoading extends CountriesState {
  @override
  List<Object> get props => [];
}

class CountriesLoaded extends CountriesState {
  final List<CountryModel>? countries;
  final List<CountryModel>? activeServices;

  const CountriesLoaded({this.countries, this.activeServices});
  @override
  List<Object> get props => [countries!, activeServices!];
}
