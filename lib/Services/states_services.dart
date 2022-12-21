// HTTP package is used to fetch data from API

import 'dart:convert';

import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:http/http.dart' as http;

import 'Utilities/app_url.dart';

class StatesServices {
// async means waiting for your request

  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
