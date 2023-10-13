import 'package:http/http.dart' as http;
import 'package:news_app_project/Model/news_data_model.dart';


class HttpService {
  static Future<List<NewsDataModel>> fetchnews() async {
    final response = await http.get(Uri.parse(
        'https://newsdata.io/api/1/news?apikey=pub_307511504508c2e9e9dbafd3a1b5685ee1a7a&country=in&language=en'));
    if (response.statusCode == 200) {
      var data = response.body;
      return newsDataModelFromJson(data);
    } else {
      throw Exception();
    }
  }
}
