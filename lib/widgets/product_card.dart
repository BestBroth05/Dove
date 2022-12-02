//Product Card

import 'package:flutter/material.dart';
import 'package:best_mod/views/product_screen.dart';

class ProductCard extends StatelessWidget {
  String img;
  ProductCard(this.img, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Color.fromRGBO(250, 243, 221, 1),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductScreen(img)));
                  },
                  child: Image.asset(
                    "Assets/${img}.png",
                    fit: BoxFit.cover,
                    height: 230,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(250, 243, 221, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(
                        Icons.favorite,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  img,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.7)),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$299",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(174, 217, 224, 1)),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
