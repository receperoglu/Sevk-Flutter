import 'package:com_hello_world/sevk/models/Articles.dart';
import 'package:com_hello_world/sevk/services/HttpService.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController {
  List<Articles> articelList = <Articles>[].obs;
  bool isLoading = false;
  Future getArticles() async {
    articelList.clear();
    isLoading = true;
    update();
    try {
      var res = await HttpService().getApi("Articels/All");
      articelList.addAll(
          List<Articles>.from((res).map((e) => Articles.fromJson(e)).toList()));
    } catch (e) {
      Get.snackbar("Hata", e.toString());
      articelList.clear();
    }
    isLoading = false;
    return articelList;
  }
}
