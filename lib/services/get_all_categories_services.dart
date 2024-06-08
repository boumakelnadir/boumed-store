import 'package:boumedstore/helper/api.dart';

class GetAllCategoriesServices {
  Future<List<dynamic>> getAllCategoriesServices() async {
    const String baseUrl = 'https://fakestoreapi.com';

    List<dynamic> data = await Api().get(uri: '$baseUrl/products/categories');

    return data;
  }
}
