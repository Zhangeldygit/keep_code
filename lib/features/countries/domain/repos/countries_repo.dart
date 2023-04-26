import 'package:keep_code/features/countries/domain/models/country_model.dart';

abstract class CountriesRepo {
  Future<List<CountryModel>> getCountries(String? serviceName);
}
