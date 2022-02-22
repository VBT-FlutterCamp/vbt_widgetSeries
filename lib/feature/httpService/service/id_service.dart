import 'package:http/http.dart' as http;
import 'package:vbt_camp_widget/feature/httpService/model/id_model.dart';

class IdService {
  Future<IdModel?> getIds(String? id) async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/$id"));

    if (response.statusCode == 200) {
      return idModelFromJson(response.body);
    } else {
      throw Exception("Gelmedim abimmm");
    }
  }
}
