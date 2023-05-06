import 'package:keep_code/features/services_and_countries/domain/models/countries_and_services_model.dart';
import 'package:keep_code/features/services_and_countries/domain/repos/countries_and_services_repo.dart';

abstract class GetCountriesAndServicesUseCase<T> {
  Future<CountriesAndServicesModel> call();
}

class GetCountriesAndServicesUseCaseImpl
    implements GetCountriesAndServicesUseCase {
  final CountriesAndServicesRepo repo;

  GetCountriesAndServicesUseCaseImpl(this.repo);

  @override
  Future<CountriesAndServicesModel> call() {
    final data = repo.getAllData();
    return data;
  }
}
