import 'package:http/http.dart' as http;
import 'package:shopping_app/constants/constant.dart';
import 'package:shopping_app/model/product.dart';

class RemoteService {
  Future<List<ProductsModel>?> getMakeup() async {
    try {
      var client = http.Client();
      var uri = Uri.parse(Strings.makeup_Url);

      var response = await client.get(uri);
      if (response.statusCode == 200) {
        var jsonString = response.body();
        return productsModelFromJson(jsonString);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
