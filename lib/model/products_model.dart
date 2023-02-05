class Product {
  int? _totalSize;
  int? _typeId;
  int? _offSet;
  late List<ProductsModel> _products;
  List<ProductsModel> get products => _products;

  Product({required totalSize, required typeId, required offSet}) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offSet = offSet;
    _products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offSet = json['offset'];
    if (json['products'] != null) {
      _products = <ProductsModel>[];
      (json['products'] as List).forEach((e) {
        products.add(ProductsModel.fromJson(e));
      });
    } else {}
  }
}

class ProductsModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? typeId;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeId = json['type_id'];
  }
}
