import 'package:hive_flutter/hive_flutter.dart';
import 'package:keep_code/features/services/domain/models/service_model.dart';

abstract class LocalServicesDataSource {
  Future<List<ServiceModel>> getServices();
  Future<void> addService(ServiceModel service);
}

class LocalServicesDataSourceImpl implements LocalServicesDataSource {
  Future<Box> _openServicesBox() async {
    return Hive.openBox<ServiceModel>('services');
  }

  @override
  Future<List<ServiceModel>> getServices() async {
    Box<ServiceModel> box = await _openServicesBox() as Box<ServiceModel>;
    return box.values.toList().map((service) => service).toList();
  }

  @override
  Future<void> addService(ServiceModel service) async {
    Box box = await _openServicesBox();
    await box.put(service.sellTop, service);
  }
}
