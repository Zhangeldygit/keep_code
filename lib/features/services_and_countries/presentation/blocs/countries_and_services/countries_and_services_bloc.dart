import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_code/features/services_and_countries/domain/models/countries_and_services_model.dart';
import 'package:keep_code/features/services_and_countries/domain/use_cases/countries_and_services_use_cases.dart';

part 'countries_and_services_event.dart';
part 'countries_and_services_state.dart';

class CountriesAndServicesBloc
    extends Bloc<CountriesAndServicesEvent, CountriesAndServicesState> {
  GetCountriesAndServicesUseCase countriesAndServicesUseCase;
  CountriesAndServicesBloc({required this.countriesAndServicesUseCase})
      : super(CountriesAndServicesInitial()) {
    on<CountriesAndServicesEvent>((event, emit) async {
      try {
        emit(CountriesAndServicesLoading());

        final data = await countriesAndServicesUseCase.call();

        emit(CountriesAndServicesSuccess(data: data));
      } catch (e) {
        emit(CountriesAndServicesError(error: e.toString()));
      }
    });
  }
}
