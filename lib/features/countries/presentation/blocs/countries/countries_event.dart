part of 'countries_bloc.dart';

abstract class CountriesEvent extends Equatable {
  const CountriesEvent();

  @override
  List<Object> get props => [];
}

class GetCountries extends CountriesEvent {
  final String? serviceName;

  const GetCountries({this.serviceName});
  @override
  List<Object> get props => [serviceName ?? ''];
}

// class AddService extends CountriesEvent {
//   final CountryModel countryModel;

//   const AddService({required this.countryModel});
// }
