import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClientView extends StatelessWidget {
  static const routeName = '/cart';
  final cart;

  ClientView({this.cart});

  Future<bool> _goback(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/dashboard')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  _update() {
    var order = {};
    for (var product in cart) {
      var order = {"order": {}};
      FirebaseFirestore.instance.collection("orders").add(product).then((_) {
        print("collection ");
      }).catchError((_) {
        print("an error occured");
      });
    }
    return;
  }

  showAlertDialog(context) {
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
      title: Text("Add Delivery Address"),
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
        body: ListView(
          children: [
            Container(
              color: Colors.blue[50],
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ClientName",
                    style: TextStyle(color: Colors.blue, fontSize: 15.0),
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Text("Orders"),
                      Expanded(child: Divider()),
                    ],
                  ),
                  for (var product in cart)
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.shopping_bag_sharp, size: 35),
                        title: Text(
                          product['Name'],
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          product['price'],
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10.0, 0, 2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Location",
                            style: TextStyle(fontSize: 13, color: Colors.blue),
                          ),
                        ),
                        Container(
                          child: Text("Date of Delivery",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.green)),
                        ),
                        Container(
                            child: TextButton.icon(
                          style: TextButton.styleFrom(
                              textStyle: TextStyle(color: Colors.white),
                              backgroundColor: Colors.blue.shade500,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.00))),
                          onPressed: () => {},
                          label: Text(
                            'Submit Order',
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.white),
                          ),
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.red,
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
