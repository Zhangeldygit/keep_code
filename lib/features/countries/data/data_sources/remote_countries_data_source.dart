import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:keep_code/features/countries/domain/models/country_model.dart';

abstract class RemoteCountriesDataSource {
  Future<List<CountryModel>> getCountries(String? serviceName);
}

class RemoteCountiresDataSourceImpl implements RemoteCountriesDataSource {
  @override
  Future<List<CountryModel>> getCountries(String? serviceName) async {
    try {
      final url =
          'https://sms-activate.org/stubs/apiMobile.php?owner=6&service=$serviceName&forward=0&action=getTopCountriesByService';
      final response = await http.get(Uri.parse(url));
      final parced = jsonDecode(response.body);

      final list = (parced as Map).values.toList();

      return list.map((e) => CountryModel.fromJson(e)).toList();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
