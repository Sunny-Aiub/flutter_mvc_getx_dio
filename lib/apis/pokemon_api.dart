import 'package:dio/dio.dart';

import '../utils/globals.dart';

class PokemonApi {
  final dio = Dio();

  Future<dynamic> getPokemonList(String url) async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

  Future<dynamic> getDetails({required String url}) async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}
