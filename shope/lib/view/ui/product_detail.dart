import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shope/controller/product_controller.dart';
import 'package:shope/model/index.dart';

class ProductDeatilPage extends StatefulWidget {
  final int productID;

  const ProductDeatilPage({super.key, required this.productID});

  @override
  State<ProductDeatilPage> createState() => _ProductDeatilPageState();
}

class _ProductDeatilPageState extends State<ProductDeatilPage> {
  late ProductDetail productDetail;
  ProductController productController =
      Get.put<ProductController>(ProductController());
  @override
  void initState() {
    super.initState();
    productDetail = productController.getProductDetailById(widget.productID);
    log(productDetail.discount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  getBanner(),
                  getTopBar(),
                  getRating(),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    getBasicInfo(),
                    getPriceInfo(),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 

                        Text("Available Options",
                        style: GoogleFonts.inter( 
                          fontWeight: FontWeight.bold
                        ),),

                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productDetail.availableSizes.length,
                        itemBuilder: (context,index){
                          var size = productDetail.availableSizes[index];
                        return Container( 
                          child: Text(size),
                        )
                      })
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        padding: EdgeInsets.zero,
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: 30,
                    ),
                    color: Colors.green.shade700,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.bag,
                          color: const Color.fromARGB(152, 255, 255, 255),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add To Bag",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: 30,
                    ),
                    color: const Color.fromARGB(21, 56, 142, 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border,
                            color: Colors.green.shade500),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Wishlist",
                          style: GoogleFonts.inter(
                            color: Colors.green.shade900,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Row getBasicInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [getTitleDis(), getTopIcon(Icons.favorite_border)],
    );
  }

  Container getTitleDis() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.green.withOpacity(.2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productDetail.title,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w900,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Text(
            productDetail.description,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Column getPriceInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "₹ ${productDetail.originalPrice}",
              style: GoogleFonts.inter(
                color: Colors.grey.shade900,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              "₹${productDetail.originalPrice}",
              style: GoogleFonts.inter(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w800,

                // decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(productDetail.discount,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.grey.shade900,
                ))
          ],
        ),
        Text(
          "Inclusive of All taxes",
          style: GoogleFonts.inter(
              color: Colors.green.shade600, fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  Positioned getRating() {
    return Positioned(
      left: 10,
      bottom: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(148, 222, 205, 205),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.star_border_outlined,
              color: Colors.yellow,
              size: 16,
            ),
            const SizedBox(width: 10),
            Text(
              productDetail.rating.toString(),
              style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Image getBanner() {
    return Image.network(
      productDetail.images[0], //have only one image
      fit: BoxFit.cover,
      width: double.infinity,
      // height: 200,
    );
  }

  Container getTopBar() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          Row(
            children: [
              getTopIcon(Icons.home_outlined),
              getTopIcon(CupertinoIcons.bag),
              getTopIcon(Icons.share_outlined),
            ],
          )
        ],
      ),
    );
  }

  Container getTopIcon(IconData icon) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(207, 231, 219, 219)),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
