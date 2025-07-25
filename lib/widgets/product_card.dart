import 'package:e_commerce_app/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => provider.toggleFavorite(widget.product),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    provider.isExist(widget.product)
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150,
            width: 150,
            child: Image.asset(widget.product.image, fit: BoxFit.cover),
          ),
          Text(
            widget.product.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.product.category,
            style: TextStyle(fontSize: 14, color: Colors.purple),
          ),
          Text(
            '\$'
            '${widget.product.price}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
