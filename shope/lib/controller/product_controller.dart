import 'dart:developer';

import 'package:get/get.dart';
import '../constant/index.dart';
import '../model/index.dart';

class ProductController extends GetxController {
  late ProductListModel products;

  @override
  void onInit() {
    super.onInit();

    fetchProductList();
  }

  void fetchProductList() {
    products = ProductListModel.fromMap(productList);
  }

  ProductDetail getProductDetailById(int id) {
    List<Map<String, dynamic>> proDeList = productDetail["productDetail"];
    // log(proDeList.toString());
    Map<String, dynamic> productAtId = proDeList[id-1];
    // log(productAtId.toString());
    return ProductDetail.fromJson(productAtId);
  }
}
