import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_code/features/countries/domain/models/country_model.dart';
import 'package:keep_code/features/countries/domain/use_cases/countries_use_cases.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final GetCountriesUseCase countriesUseCase;

  CountriesBloc({required this.countriesUseCase}) : super(CountriesInitial()) {
    on<GetCountries>((event, emit) async {
      emit(CountriesLoading());

      final countries = await countriesUseCase.call(event.serviceName);

      emit(CountriesLoaded(countries: countries));
    });
  }
}
