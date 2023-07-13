import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:mobile_app/controller/cart_controller.dart';
import 'package:mobile_app/model/product.dart';

class CatalogProduct extends StatelessWidget {
  const CatalogProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          itemCount: Product.products.length,
          itemBuilder: (BuildContext context, int index) {
            return CatalogProductCard(index: index);
          }),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final int index;
  CatalogProductCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Expanded(
        child: Card(
          child: Column(
            children: [
              Image.asset(
                Product.products[index].imageUrl,
                height: 250,
              ),

              SizedBox(
                height: 20,
              ),

              //For cart and text in column
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //For name and price
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Product.products[index].name,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Hans j. wegner',
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(131, 0, 0, 0),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(
                                color: Color(0xFFF2A666),
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              Product.products[index].price.toString(),
                              style: TextStyle(
                                color: Color(0xFFF2A666),
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),

                    CircleAvatar(
                      backgroundColor: Color(0xFF0C8A7B),
                      child: IconButton(
                        onPressed: () {
                          cartController.addProduct(Product.products[index]);
                        },
                        icon: Icon(Icons.shopping_cart),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ), //Row(
            ],
          ),
        ),
      ),
    );
  }
}
