import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
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
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(0.00, 5.00, 0.00, 0.00),
            child: Image.asset(
              'assets/images/pnp.jpg',
              fit: BoxFit.cover,
              height: 100.00,
            ),
          )),
          Container(
            alignment: Alignment.topLeft,
            child: Text('Name',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15.0,
                )),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Description Description is that',
              style: TextStyle(fontSize: 10.00),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Text(
                  '\$',
                  style: TextStyle(fontSize: 15.00),
                ),
                Text(
                  'Price',
                  style: TextStyle(fontSize: 15.00),
                )
              ],
            ),
          ),
          Container(
              alignment: Alignment.bottomLeft,
              child: TextButton.icon(
                style: TextButton.styleFrom(
                    textStyle: TextStyle(color: Colors.white),
                    backgroundColor: Colors.blue.shade500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.00))),
                onPressed: () => {},
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
