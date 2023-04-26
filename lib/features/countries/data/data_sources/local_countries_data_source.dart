import 'package:hive_flutter/hive_flutter.dart';
import 'package:keep_code/features/countries/domain/models/country_model.dart';

abstract class LocalCountriesDataSource {
  Future<List<CountryModel>> getCountries();
  Future<void> addCountry(CountryModel country);
}

class LocalCountriesDataSourceImpl implements LocalCountriesDataSource {
  Future<Box> _openCountriesBox() async {
    return Hive.openBox<CountryModel>('countries');
  }

  @override
  Future<List<CountryModel>> getCountries() async {
    Box<CountryModel> box = await _openCountriesBox() as Box<CountryModel>;
    return box.values.toList().map((country) => country).toList();
  }

  @override
  Future<void> addCountry(CountryModel country) async {
    Box box = await _openCountriesBox();
    await box.put(country.count, country);
  }
}
