// main.dart
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'product_card_widget.dart';
// import 'search_card.dart';

// Search Page
class GlobalSearchScreen extends StatelessWidget {
  static const routeName = '/search';
  const GlobalSearchScreen({Key? key}) : super(key: key);

  Future<bool> _goback(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/dashboard')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () => _goback(context),
            ),
            // The search area here
            title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          /* Clear the search field */
                        },
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none),
                ),
              ),
            )),
        body: GridView.count(
          addAutomaticKeepAlives: false,
          cacheExtent: 100.00,
          shrinkWrap: true,
          crossAxisCount: 2,
          children: [
            ProductCardWidget(),
            ProductCardWidget(),
            ProductCardWidget()
            // constructing cards
          ],
        )
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,

        //   children: [
        //   Expanded(child: Container(
        //     flex
        //   )),
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         SizedBox(
        //           width: 100.00,
        //           height: 100.00,
        //           child: Container(
        //             alignment: Alignment.topLeft,
        //             padding: const EdgeInsets.fromLTRB(0.00, 5.00, 0.00, 0.00),
        //             // constraints: BoxConstraints.expand(height: 50.00, width: 50.00),
        //             width: 100.00,
        //             child: Image.asset(
        //               'assets/images/pnp.jpg',
        //               fit: BoxFit.fitWidth,
        //               height: 100.00,
        //               width: 100.00,
        //             ),

        //             // Container(child: ImageContainer("asserts/images/ok.png")),
        //           ),
        //         ),
        //         Container(
        //           alignment: Alignment.topLeft,
        //           child: Text('Name',
        //               textAlign: TextAlign.start,
        //               style: TextStyle(
        //                 fontSize: 15.0,
        //               )),
        //         ),
        //         Container(
        //           alignment: Alignment.topLeft,
        //           child: Text(
        //             'Description Description is that',
        //             style: TextStyle(fontSize: 10.00),
        //           ),
        //         ),
        //         Container(
        //           alignment: Alignment.bottomLeft,
        //           child: Row(
        //             children: [
        //               Text(
        //                 '\$',
        //                 style: TextStyle(fontSize: 15.00),
        //               ),
        //               Text(
        //                 'Price',
        //                 style: TextStyle(fontSize: 15.00),
        //               )
        //             ],
        //           ),
        //         ),
        //         Container(
        //             alignment: Alignment.bottomLeft,
        //             child: TextButton.icon(
        //               style: TextButton.styleFrom(
        //                   textStyle: TextStyle(color: Colors.white),
        //                   backgroundColor: Colors.grey,
        //                   shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(10.00))),
        //               onPressed: () => {},
        //               label: Text(
        //                 'Add to cart',
        //                 style: TextStyle(fontSize: 10.0),
        //               ),
        //               icon: Icon(Icons.shopping_bag_outlined),
        //             ))
        //       ],
        //     ),
        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         SizedBox(
        //           width: 100.00,
        //           height: 100.00,
        //           child: Container(
        //             alignment: Alignment.topLeft,
        //             padding: const EdgeInsets.fromLTRB(0.00, 5.00, 0.00, 0.00),
        //             // constraints: BoxConstraints.expand(height: 50.00, width: 50.00),
        //             width: 100.00,
        //             child: Image.asset(
        //               'assets/images/pnp.jpg',
        //               fit: BoxFit.fitWidth,
        //               height: 100.00,
        //               width: 100.00,
        //             ),

        //             // Container(child: ImageContainer("asserts/images/ok.png")),
        //           ),
        //         ),
        //         Container(
        //           alignment: Alignment.topLeft,
        //           child: Text('Name',
        //               textAlign: TextAlign.start,
        //               style: TextStyle(
        //                 fontSize: 15.0,
        //               )),
        //         ),
        //         Container(
        //           alignment: Alignment.topLeft,
        //           child: Text(
        //             'Description Description is that',
        //             style: TextStyle(fontSize: 10.00),
        //           ),
        //         ),
        //         Container(
        //           alignment: Alignment.bottomLeft,
        //           child: Row(
        //             children: [
        //               Text(
        //                 '\$',
        //                 style: TextStyle(fontSize: 15.00),
        //               ),
        //               Text(
        //                 'Price',
        //                 style: TextStyle(fontSize: 15.00),
        //               )
        //             ],
        //           ),
        //         ),
        //         Container(
        //             alignment: Alignment.bottomLeft,
        //             child: TextButton.icon(
        //               style: TextButton.styleFrom(
        //                   textStyle: TextStyle(color: Colors.white),
        //                   backgroundColor: Colors.grey,
        //                   shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(10.00))),
        //               onPressed: () => {},
        //               label: Text(
        //                 'Add to cart',
        //                 style: TextStyle(fontSize: 10.0),
        //               ),
        //               icon: Icon(Icons.shopping_bag_outlined),
        //             ))
        //       ],
        //     )
        //   ],
        );
  }
}
