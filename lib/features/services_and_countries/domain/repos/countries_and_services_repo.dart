import 'package:keep_code/features/services_and_countries/domain/models/countries_and_services_model.dart';

abstract class CountriesAndServicesRepo {
  Future<CountriesAndServicesModel> getAllData();
}
