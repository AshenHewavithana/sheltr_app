import 'package:sheltr_flutter/src/features/core/models/autocomplete_results.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MapServices {
  final String key = 'AIzaSyDf77gb6Ft58tXIv1yUCEIqcoFThPUE9VM';
  final String types = 'geocode';

  Future<List<AutoCompleteResult>> searchPlaces(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);

    var results = json['predictions'] as List;

    return results.map((e) => AutoCompleteResult.fromJson(e)).toList();
  }

  Future<Map<String, dynamic>> getPlaces(String? input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?place_id=$input&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);

    var results = json['result'] as Map<String, dynamic>;

    return results;
  }
}
