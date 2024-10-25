import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shope/controller/product_controller.dart';
import 'package:shope/view/widgets/app_bar_widget.dart';
import 'package:shope/view/widgets/product_list_widget.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  @override
  Widget build(BuildContext context) {
    ProductController productController =
        Get.put<ProductController>(ProductController());

    return Scaffold(
      appBar: getAppBar(productController),
      body: ProductsBodyWidget(productController: productController),
    );
  }

 
}
