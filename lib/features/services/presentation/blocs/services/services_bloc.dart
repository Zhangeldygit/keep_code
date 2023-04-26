import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_code/features/services/domain/models/service_model.dart';
import 'package:keep_code/features/services/domain/user_cases/services_use_cases.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final GetServicesUseCase servicesUseCase;

  ServicesBloc({required this.servicesUseCase}) : super(ServicesInitial()) {
    on<GetServices>((event, emit) async {
      emit(ServicesLoading());

      final services = await servicesUseCase.call();

      emit(ServicesLoaded(services: services));
    });
  }
}
