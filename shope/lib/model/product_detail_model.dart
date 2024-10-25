class ProductDetail {
  final int id;
  final String title;
  final String description;
  final double price;
  final double originalPrice;
  final String discount;
  final String taxInfo;
  final List<String> images;
  final double rating;
  final bool isFavorite;
  final List<String> availableSizes;
  final String selectedSize;
  final DeliveryService deliveryServices;
  final ProductDetails productDetails;
  final String extraInfo;

  ProductDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.taxInfo,
    required this.images,
    required this.rating,
    required this.isFavorite,
    required this.availableSizes,
    required this.selectedSize,
    required this.deliveryServices,
    required this.productDetails,
    required this.extraInfo,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      originalPrice: json['originalPrice'].toDouble(),
      discount: json['discount'],
      taxInfo: json['taxInfo'],
      images: List<String>.from(json['images']),
      rating: json['rating'].toDouble(),
      isFavorite: json['isFavorite'],
      availableSizes: List<String>.from(json['availableSizes']),
      selectedSize: json['selectedSize'],
      deliveryServices: DeliveryService.fromJson(json['deliveryServices']),
      productDetails: ProductDetails.fromJson(json['productDetails']),
      extraInfo: json['extraInfo'],
    );
  }
}

class DeliveryService {
  final String pincode;
  final String status;

  DeliveryService({
    required this.pincode,
    required this.status,
  });

  factory DeliveryService.fromJson(Map<String, dynamic> json) {
    return DeliveryService(
      pincode: json['pincode'],
      status: json['status'],
    );
  }
}

class ProductDetails {
  final String details1;
  final String details2;
  final String details3;
  final String details4;
  final String details5;

  ProductDetails({
    required this.details1,
    required this.details2,
    required this.details3,
    required this.details4,
    required this.details5,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      details1: json['details1'],
      details2: json['details2'],
      details3: json['details3'],
      details4: json['details4'],
      details5: json['details5'],
    );
  }
}
