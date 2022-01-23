import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cart extends StatefulWidget {
  double count;
  final double price;
  final String Name;
  final String Description;

  static const routeName = '/cart';

  Cart(
      {Key? key,
      required this.count,
      required this.price,
      required this.Name,
      required this.Description})
      : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Future<bool> _goback(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/dashboard')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
  }

  Widget _buildCard() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${widget.Name.toString()}",
                      style: TextStyle(
                          fontSize: 20.0, color: Colors.blue.shade700),
                    ),
                    Text(
                      "${widget.Description.toString()}",
                      style: TextStyle(
                          fontSize: 10.0, color: Colors.blue.shade500),
                    ),
                    Text(
                      "\$ ${widget.price.toString()}",
                      style: TextStyle(
                          fontSize: 13.0, color: Colors.blue.shade300),
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                    alignment: Alignment.topRight,
                    width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Quantity",
                            style: TextStyle(
                                fontSize: 10.0, color: Colors.blue[700]),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade700,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  setState(() {
                                    if (widget.count > 1) {
                                      widget.count--;
                                    }
                                  });
                                },
                              ),
                              Text(
                                widget.count.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(
                                child: Icon(Icons.add, color: Colors.white),
                                onTap: () {
                                  setState(() {
                                    widget.count++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
              width: 100.0,
              alignment: Alignment.center,
              child: TextButton.icon(
                style: TextButton.styleFrom(
                    textStyle: TextStyle(color: Colors.white),
                    backgroundColor: Colors.blue.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.00))),
                onPressed: () => {},
                label: Text(
                  'Remove',
                  style: TextStyle(fontSize: 10.0, color: Colors.red),
                ),
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.red,
                ),
              ))
        ],
      ),
    );
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.userCircle),
                    onPressed: () {
                      print("pressed!!");
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.cartPlus),
                    onPressed: () {
                      print("pressed!!");
                    },
                  )
                ],
              ),
            )),
        body: ListView(
          children: <Widget>[
            _buildCard(),
          ],
        )
        // ListView(
        //   // cart items show here
        //   padding: const EdgeInsets.all(8.0),
        //   children: [
        //     Card(
        //         clipBehavior: Clip.antiAlias,
        //         child: Column(
        //           children: [
        //             ListTile(
        //               title: Text("Product Name"),
        //               subtitle: NumberInputWithIncrementDecrement(
        //                 scaleHeight: .5,
        //                 scaleWidth: .5,
        //                 style: TextStyle(fontSize: 20.00),
        //                 controller: TextEditingController(),
        //                 min: 1,
        //                 max: 10,
        //               ),
        //             ),
        //             ButtonBar(
        //               alignment: MainAxisAlignment.start,
        //               children: [
        //                 Container(
        //                   child: TextButton.icon(
        //                     style: TextButton.styleFrom(
        //                         textStyle: TextStyle(color: Colors.white),
        //                         backgroundColor: Colors.blue.shade500,
        //                         shape: RoundedRectangleBorder(
        //                             borderRadius: BorderRadius.circular(10.00))),
        //                     onPressed: () => {},
        //                     label: Text(
        //                       'Add to cart',
        //                       style:
        //                           TextStyle(fontSize: 10.0, color: Colors.white),
        //                     ),
        //                     icon: Icon(
        //                       Icons.shopping_bag_outlined,
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             )
        //           ],
        //         ))
        //   ],
        // ),
        );
  }
}
