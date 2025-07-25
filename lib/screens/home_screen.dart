import 'package:e_commerce_app/models/my_product.dart';
import 'package:e_commerce_app/screens/details_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: const Text(
            'Our Products',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(name: 'All Products', index: 0),
              _buildProductCategory(name: 'Jackets', index: 1),
              _buildProductCategory(name: 'Sneakers', index: 2),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child:
              isSelected == 0
                  ? _buildAllProducts()
                  : isSelected == 1
                  ? _buildJackets()
                  : _buildSneakers(),
        ),
      ],
    );
  }

  _buildAllProducts() => GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100 / 120),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.allProducts.length,
    itemBuilder: (context, index) {
      final allProducts = MyProducts.allProducts[index];
      return GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(product: allProducts),
              ),
            ),

        child: ProductCard(product: allProducts),
      );
    },
  );

  _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 150,
          height: 40,
          margin: const EdgeInsets.only(top: 4, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.purple : Colors.purple.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(name, style: TextStyle(color: Colors.white)),
        ),
      );

  _buildJackets() => GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100 / 120),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.jacketsList.length,
    itemBuilder: (context, index) {
      final jacketsList = MyProducts.jacketsList[index];
      return GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(product: jacketsList),
              ),
            ),
        child: ProductCard(product: jacketsList),
      );
    },
  );

  _buildSneakers() => GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100 / 120),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.sneakersList.length,
    itemBuilder: (context, index) {
      final sneakersList = MyProducts.sneakersList[index];
      return GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(product: sneakersList),
              ),
            ),
        child: ProductCard(product: sneakersList),
      );
    },
  );
}
