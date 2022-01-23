import 'package:flutter/material.dart';

class CartCard extends StatefulWidget {
  double count;
  final double price;
  final String Name;
  final String Description;

  CartCard(
      {Key? key,
      required this.count,
      required this.price,
      required this.Name,
      required this.Description})
      : super(key: key);

  @override
  State<CartCard> createState() => _CartState();
}

class _CartState extends State<CartCard> {
  Widget build(BuildContext context) => Card(
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
                      padding: const EdgeInsets.fromLTRB(0, 10.0, 10.00, 0),
                      alignment: Alignment.centerRight,
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10.00),
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
