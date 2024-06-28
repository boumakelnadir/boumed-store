class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.desc,
    required this.category,
    required this.image,
    required this.rating,
  });
  final String id;
  final String title;
  final String price;
  final String desc;
  final String category;
  final String image;
  final RatingModel rating;

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'].toString(),
      title: jsonData['title'],
      price: jsonData['price'].toString(),
      desc: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: RatingModel.fromJson(jsonData),
    );
  }
}

class RatingModel {
  RatingModel({required this.count, required this.rate});
  final dynamic rate;
  final dynamic count;

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: jsonData['rate'].toString(),
      count: jsonData['count'].toString(),
    );
  }
}
