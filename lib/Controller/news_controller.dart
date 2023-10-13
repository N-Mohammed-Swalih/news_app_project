import 'package:get/get.dart';
import '../Service/api_service.dart';

class Result extends GetxController {
  var isLoading = true.obs; //monitor the changes in the variable
  // obx is used for widgets to monitor the changes.
  var newsList = [].obs;

//to get the values from the api in the initial state
  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  void getNews() async {
    try {
      isLoading(true);
      var news = await HttpService.fetchnews();
      if (news != null) {
        newsList.value = news;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
