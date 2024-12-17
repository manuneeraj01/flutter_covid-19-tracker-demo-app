import 'dart:convert';

import 'package:covid_19/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

import '../modal/world_state_model.dart';

class StatesServices {
  Future<WorldStateModel> fetchWorldStatesRecord() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (response.statusCode == 200) {
      return WorldStateModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("fetchWorldStatesRecord error");
    }
  }

  Future<List<dynamic>> fetchCountriesListRecord() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("fetchCountriesListRecord error");
    }
  }
}
