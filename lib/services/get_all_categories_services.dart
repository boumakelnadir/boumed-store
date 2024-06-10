import 'package:boumedstore/helper/api.dart';

class GetCategoriesServices {
  Future<List<dynamic>> getCategoriesServices() async {
    const String baseUrl = 'https://fakestoreapi.com';

    List<dynamic> data = await Api().get(uri: '$baseUrl/products/categories');

    return data;
  }
}
