import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final product;
  final onCallback;

  ProductCardWidget({this.product, this.onCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.all(5.00),
      padding: const EdgeInsets.fromLTRB(5.00, 0.00, 5.00, 0.00),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.purple.shade100,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(0.00, 5.00, 0.00, 0.00),
              child: Image.asset(
                'assets/images/pnp.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(product['Name'],
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Description Description is that',
              style: TextStyle(fontSize: 10.00),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ZWL',
                  style: TextStyle(fontSize: 15.00),
                ),
                Text(
                  product['price'],
                  style: TextStyle(fontSize: 15.00),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              child: TextButton.icon(
                style: TextButton.styleFrom(
                    textStyle: TextStyle(color: Colors.white),
                    backgroundColor: Colors.blue.shade400,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.00))),
                onPressed: () => {this.onCallback()},
                label: Text(
                  'Add to cart',
                  style: TextStyle(fontSize: 10.0, color: Colors.white),
                ),
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
