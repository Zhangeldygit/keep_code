import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:keep_code/features/countries/data/data_sources/local_countries_data_source.dart';
import 'package:keep_code/features/countries/data/data_sources/remote_countries_data_source.dart';
import 'package:keep_code/features/countries/domain/models/country_model.dart';
import 'package:keep_code/features/countries/domain/repos/countries_repo.dart';

class CountriesRepoImpl implements CountriesRepo {
  final RemoteCountriesDataSource remoteCountriesDataSource;
  final LocalCountriesDataSource localCountriesDataSource;

  CountriesRepoImpl(
      this.remoteCountriesDataSource, this.localCountriesDataSource);

  @override
  Future<List<CountryModel>> getCountries(String? serviceName) async {
    final result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      final countries =
          await remoteCountriesDataSource.getCountries(serviceName);
      for (final country in countries) {
        await localCountriesDataSource.addCountry(country);
      }
      return countries;
    } else {
      final countries = localCountriesDataSource.getCountries();
      return countries;
    }
  }
}
