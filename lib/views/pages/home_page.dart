import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/gets/api_controller.dart';
import '../../controllers/utils/helper_functions.dart';
import '../../models/product_model.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiController authController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: GetBuilder<ApiController>(
        init: ApiController(),
        builder: (authCon) {
          return authCon.productList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                )
              : GridView.builder(
                  itemCount: authCon.productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final product = authCon.productList[index];
                    return productItem(product: product);
                  },
                );
        },
      ),
    );
  }

  Widget productItem({required ProductModel product}) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                product.subCategory!.category!.image!,
                height: mediaWidth(context) * 0.38888,
                width: mediaWidth(context) * 0.38888,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                product.name!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Price: ${product.productPrice!.price.toString()}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
