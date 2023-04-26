import 'package:keep_code/features/countries/domain/models/country_model.dart';
import 'package:keep_code/features/countries/domain/repos/countries_repo.dart';

abstract class GetCountriesUseCase<T> {
  Future<List<CountryModel>> call(String? serviceName);
}

class GetCountriesUseCaseImpl implements GetCountriesUseCase {
  final CountriesRepo repo;

  GetCountriesUseCaseImpl(this.repo);

  @override
  Future<List<CountryModel>> call(String? serviceName) {
    final data = repo.getCountries(serviceName);
    return data;
  }
}
