import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softic_task/controllers/utils/helper_functions.dart';
import 'package:softic_task/models/product_model.dart';

import '../../controllers/utils/colors.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: mediaHeight(context),
        width: mediaWidth(context),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: Container(
                      height: 32,
                      width: 32,
                      color: inactiveDotColor,
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: editHeaderColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: mediaWidth(context) * .6,
                            width: mediaWidth(context) * .6,
                            color: Colors.white,
                            child: Image.network(
                                product.subCategory!.category!.image!),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Name: ${product.name!}',
                        style: GoogleFonts.dmSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: textFieldBgColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Description: ${product.description!}',
                        style: GoogleFonts.dmSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: textFieldBgColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Brand: ${product.brand!.name}',
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: textFieldBgColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Category: ${product.subCategory!.category!.name}',
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: textFieldBgColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Price: ${product.productPrice!.price}',
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: textFieldBgColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
