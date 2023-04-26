import 'package:keep_code/features/services/domain/models/service_model.dart';
import 'package:keep_code/features/services/domain/repos/services_repo.dart';

abstract class GetServicesUseCase<T> {
  Future<List<ServiceModel>> call();
}

class GetServicesUseCaseImpl implements GetServicesUseCase {
  final ServicesRepo repo;

  GetServicesUseCaseImpl(this.repo);

  @override
  Future<List<ServiceModel>> call() {
    final data = repo.getServices();
    return data;
  }
}
