
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shope/controller/product_controller.dart';
import 'package:shope/model/product_list_model.dart';
import 'package:shope/view/ui/product_detail.dart';

class ProductsBodyWidget extends StatelessWidget {
  const ProductsBodyWidget({
    super.key,
    required this.productController,
  });

  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing:16.0,
          childAspectRatio: 0.6, 
        ),
        itemCount: productController.products.products.length,
        itemBuilder: (context, index) {
          final product = productController.products.products[index];
          return InkWell(
            onTap: (){ 
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProductDeatilPage( 
                productID:product.id
              )));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getProductBanner(product),
                const SizedBox(height: 5),
                getProductInfo(product),
                getProductPrice(product),
                const Divider(thickness: 2,),
              ],
            ),
          );
        },
      ),
    );
  }

  Expanded getProductBanner(Product product) {
    return Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover, 
                      width: double.infinity,
                      height: double.infinity, 
                    ),
                  ),
                  Positioned(
                    top: 195,
                    left: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color.fromARGB(149, 241, 174, 174),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.star_border_outlined,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            product.rating.toString(),
                            style: GoogleFonts.inter(
                                color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
  }

  Text getProductPrice(Product product) {
    return Text(
              '₹ ${product.price}',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
  
              ),
            );
  }

  Wrap getProductInfo(Product product) {
    return Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                    ),
                     Text(
                      product.description,
                      style: GoogleFonts.inter(color: Colors.grey.shade700,fontSize: 13),
                    ),
                    
                  ],
                ),
  
                IconButton(onPressed: (){}, icon: Icon(
                  product.isFavorite?
                  Icons.favorite:
                  Icons.favorite_border,
                  color: 
                  product.isFavorite?
                  Colors.red:
                  Colors.grey
                  ,
                  
                  ))
              ],
            );
  }
}
