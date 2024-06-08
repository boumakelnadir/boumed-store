import 'package:boumedstore/helper/api.dart';
import 'package:boumedstore/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
    required String id,
    required String rate,
    required String count,
  }) async {
    Map<String, dynamic> data = await Api().put(
      uri: 'https://fakestoreapi.com/products/$id',
      bodyData: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
