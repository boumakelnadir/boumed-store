import 'package:boumedstore/helper/api.dart';
import 'package:boumedstore/models/product_model.dart';

class GetCategories {
  Future<List<ProductModel>> getCategories(
      {required String categoryName}) async {
    const String baseUrl = 'https://fakestoreapi.com';

    List<dynamic> data =
        await Api().get(uri: '$baseUrl/products/category/$categoryName');

    List<ProductModel> productList = [];

    for (var i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
