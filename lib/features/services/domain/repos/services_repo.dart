import 'package:keep_code/features/services/domain/models/service_model.dart';

abstract class ServicesRepo {
  Future<List<ServiceModel>> getServices();
}
