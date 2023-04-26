import 'dart:convert';
import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:keep_code/features/services/domain/models/service_model.dart';
import 'package:http/http.dart' as http;

// @RestApi(baseUrl: "https://sms-activate.org/stubs")
// abstract class RemoteServicesDataSource {
//   factory RemoteServicesDataSource(Dio dio, {String baseUrl}) =
//       _RemoteServicesDataSource;

//   @GET("/apiMobile.php")
//   Future<List<ServiceModel>> getServices(
//     @Query("refresh_token") String refreshToken,
//     @Query("sessionId") String sessionId,
//     // @Query("owner=6")
//     @Query("userid") int userId,
//     // @Query("action=getAllServices")
//   );
// }
abstract class RemoteServicesDataSource {
  Future<List<ServiceModel>> getServices();
}

class RemoteServicesDataSourceImpl implements RemoteServicesDataSource {
  @override
  Future<List<ServiceModel>> getServices() async {
    final box = Hive.box('tokens');
    final sessionId = box.get('sessionId');
    try {
      final url =
          'https://sms-activate.org/stubs/apiMobile.php?refresh_token=&sessionId=$sessionId&owner=6&userid=-1&action=getAllServices';
      final response = await http.get(Uri.parse(url));
      final parced = jsonDecode(response.body);

      return (parced as List).map((e) => ServiceModel.fromJson(e)).toList();
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
