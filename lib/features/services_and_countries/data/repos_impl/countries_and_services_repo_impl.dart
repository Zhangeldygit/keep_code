import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:keep_code/features/services_and_countries/data/data_sources/local_all_data_source.dart';
import 'package:keep_code/features/services_and_countries/data/data_sources/remote_all_data_source.dart';
import 'package:keep_code/features/services_and_countries/domain/models/countries_and_services_model.dart';
import 'package:keep_code/features/services_and_countries/domain/repos/countries_and_services_repo.dart';

class CountriesAndServicesRepoImpl implements CountriesAndServicesRepo {
  final RemoteAllDataSource remoteAllDataSource;
  final LocalAllDataSource localAllDataSource;

  CountriesAndServicesRepoImpl(
      this.remoteAllDataSource, this.localAllDataSource);
  @override
  Future<CountriesAndServicesModel> getAllData() async {
    final result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      final data = await remoteAllDataSource.getAllData();
      await localAllDataSource.addData(data);
      return data;
    } else {
      final data = await localAllDataSource.getAllData();
      return data;
    }
  }
}
