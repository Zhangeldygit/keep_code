import 'package:hive_flutter/hive_flutter.dart';
import 'package:keep_code/features/services_and_countries/domain/models/countries_and_services_model.dart';

abstract class LocalAllDataSource {
  Future<CountriesAndServicesModel> getAllData();
  Future<void> addData(CountriesAndServicesModel data);
}

class LocalAllDataSourceImpl implements LocalAllDataSource {
  Future<Box> _openServicesBox() async {
    return Hive.openBox<CountriesAndServicesModel>('allData');
  }

  @override
  Future<CountriesAndServicesModel> getAllData() async {
    Box<CountriesAndServicesModel> box =
        await _openServicesBox() as Box<CountriesAndServicesModel>;
    return box.get('countries_and_services')!;
  }

  @override
  Future<void> addData(CountriesAndServicesModel data) async {
    Box box = await _openServicesBox();
    await box.put('countries_and_services', data);
  }
}
