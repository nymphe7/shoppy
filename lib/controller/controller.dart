import 'package:shopping_app/AuthService/auth_service.dart';
import 'package:shopping_app/api_management/remote_Service.dart';
import 'package:shopping_app/model/product.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  var makeupList = <ProductsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  fetchData() async {
    try {
      isLoading(true);
      var makeup = await RemoteService().getMakeup();
      if (makeup != null) {
        makeupList.value = makeup;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

 
}
