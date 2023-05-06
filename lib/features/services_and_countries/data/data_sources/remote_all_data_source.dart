import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:keep_code/features/services_and_countries/domain/models/countries_and_services_model.dart';

abstract class RemoteAllDataSource {
  Future<CountriesAndServicesModel> getAllData();
}

class RemoteAllDataSourceImpl implements RemoteAllDataSource {
  @override
  Future<CountriesAndServicesModel> getAllData() async {
    try {
      const url =
          'https://sms-activate.org/stubs/apiMobile.php?owner=6&action=getAllServicesAndAllCountries';
      final response = await http.get(Uri.parse(url));
      final parced = jsonDecode(response.body);
      // final Map data = parced['operators'];

      // print(data
      //     .map(
      //         (key, value) => MapEntry(key, (value as Map).entries.first.value))
      //     .values
      //     .toList());

      return CountriesAndServicesModel.fromJson(parced);
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
