// main.dart
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:izi_shop/client.dart';
import 'product_card_widget.dart';
import 'transition_route_observer.dart';

// Search Page
class GlobalSearchScreen extends StatefulWidget {
  static const routeName = '/search';
  const GlobalSearchScreen({Key? key}) : super(key: key);

  @override
  State<GlobalSearchScreen> createState() => _GlobalSearchScreenState();
}

class _GlobalSearchScreenState extends State<GlobalSearchScreen> {
  List products = [];
  List cart = [];

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  Future<bool> _goback(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/dashboard')
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
            actions: [
              cart.length != 0
                  ? IconButton(
                      icon: const Icon(Icons.shopping_bag),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClientView(cart: cart)),
                      ),
                    )
                  : Text(""),
            ],
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
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('basics').snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');
            if (snapshot.hasData) {
              final docs = snapshot.data!.docs;
              return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                cacheExtent: 100.00,
                shrinkWrap: true,
                children: List.generate(docs.length, (index) {
                  final data = docs[index].data();
                  return Center(
                    child: ProductCardWidget(
                      product: data,
                      onCallback: () => {
                        cart.add(data),
                        print(cart),
                        showAlertDialog(data['Name'], cart)
                      },
                    ),
                  );
                }),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  showAlertDialog(product, cart) {
    // set up the buttons
    Widget continueButton = TextButton(
      style: TextButton.styleFrom(
          textStyle: TextStyle(color: Colors.white),
          backgroundColor: Colors.blue.shade400,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.00))),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClientView(cart: cart)),
      ),
      child: Text(
        'View Order',
        style: TextStyle(fontSize: 15.0, color: Colors.white),
      ),
    );

    Widget cancelButton = TextButton(
      child: Text("Continue Shopping"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(product + " added to cart!"),
      content: Text("Would you like to continue adding products?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
