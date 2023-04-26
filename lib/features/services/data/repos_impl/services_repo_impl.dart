import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:keep_code/features/services/data/data_sources/local_services_data_source.dart';
import 'package:keep_code/features/services/data/data_sources/remote_services_data_source.dart';
import 'package:keep_code/features/services/domain/models/service_model.dart';
import 'package:keep_code/features/services/domain/repos/services_repo.dart';

class ServicesRepoImpl implements ServicesRepo {
  final RemoteServicesDataSource remoteServicesDataSource;
  final LocalServicesDataSource localServicesDataSource;

  ServicesRepoImpl(this.remoteServicesDataSource, this.localServicesDataSource);
  @override
  Future<List<ServiceModel>> getServices() async {
    final result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      final services = await remoteServicesDataSource.getServices();
      for (final service in services) {
        await localServicesDataSource.addService(service);
      }
      return services;
    } else {
      final services = await localServicesDataSource.getServices();
      return services;
    }
  }
}
