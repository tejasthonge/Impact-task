import 'dart:convert';

class ProductListModel {
  final String pageTitle;
  final List<Product> products;
  ProductListModel({
    required this.pageTitle,
    required this.products,
  });

  ProductListModel copyWith({
    String? pageTitle,
    List<Product>? products,
  }) {
    return ProductListModel(
      pageTitle: pageTitle ?? this.pageTitle,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pageTitle': pageTitle,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductListModel.fromMap(Map<String, dynamic> map) {
    return ProductListModel(
      pageTitle: map['pageTitle'] as String,
      products: List<Product>.from((map['products'] as List<dynamic>).map<Product>((x) => Product.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductListModel.fromJson(String source) => ProductListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductListModel(pageTitle: $pageTitle, products: $products)';

 

  @override
  int get hashCode => pageTitle.hashCode ^ products.hashCode;
}

class Product {
  final int id;
  final String title;
  final String description;
  final int price;
  final String image;
  final double rating;
  final bool isFavorite;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.rating,
    required this.isFavorite,
  });

  Product copyWith({
    int? id,
    String? title,
    String? description,
    int? price,
    String? image,
    double? rating,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'image': image,
      'rating': rating,
      'isFavorite': isFavorite,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'].toInt() as int,
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'].toInt() as int,
      image: map['image'] as String,
      rating: map['rating'].toDouble() as double,
      isFavorite: map['isFavorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, title: $title, description: $description, price: $price, image: $image, rating: $rating, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.price == price &&
      other.image == image &&
      other.rating == rating &&
      other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      price.hashCode ^
      image.hashCode ^
      rating.hashCode ^
      isFavorite.hashCode;
  }
}