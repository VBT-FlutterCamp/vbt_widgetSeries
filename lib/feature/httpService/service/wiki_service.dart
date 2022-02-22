import 'package:http/http.dart' as http;

import '../model/wiki_model.dart';

class WikiService {
  Future<WikiModel> getWikipedia() async {
    final response = await http.get(Uri.parse(
        "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents/Tiger_King/daily/20210901/20210930"));

    if (response.statusCode == 200) {
      return wikiModelFromJson(response.body);
    } else {
      throw Exception("Datalar gelmedi abim");
    }
  }
}
