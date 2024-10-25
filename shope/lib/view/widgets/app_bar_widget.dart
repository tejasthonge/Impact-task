 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shope/controller/product_controller.dart';

AppBar getAppBar(ProductController productController) {
    return AppBar(
      centerTitle: false,
      title: Text(
        productController.products.pageTitle,
        style: GoogleFonts.inter(fontWeight: FontWeight.w500),
      ),
      foregroundColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 28, 138, 32),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder( 
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }