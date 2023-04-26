import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:keep_code/features/countries/domain/models/country_model.dart';

part 'active_services_event.dart';
part 'active_services_state.dart';

class ActiveServicesBloc
    extends Bloc<ActiveServicesEvent, ActiveServicesState> {
  ActiveServicesBloc() : super(ActiveServicesInitial()) {
    on<AddService>((event, emit) async {
      emit(ActiveServicesLoading());

      final box = Hive.box('service');

      if (!box.containsKey(event.countryModel)) {
        box.add(event.countryModel);
      } else {
        emit(const ActiveServicesFailure(message: 'Сервис активный'));
      }
      final values = box.values.toList(growable: false);
      final activeServices = <CountryModel>[];
      activeServices.addAll(values.cast());

      emit(ActiveServicesLoaded(activeServices: activeServices));
    });
  }
}
