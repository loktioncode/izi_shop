import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClientView extends StatelessWidget {
  const ClientView({Key? key}) : super(key: key);

  Future<bool> _goback(BuildContext context) {
    return Navigator.of(context)
        .pushReplacementNamed('/dashboard')
        // we dont want to pop the screen, just replace it completely
        .then((_) => false);
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Price           Qua"),
                    ],
                  ),
                  product(),
                  product(),
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
                              backgroundColor: Colors.blue.shade200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.00))),
                          onPressed: () => {},
                          label: Text(
                            'Delivered!',
                            style: TextStyle(fontSize: 10.0, color: Colors.red),
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

class product extends StatelessWidget {
  const product({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 180,
                  child: Expanded(
                    child: Text(
                        "ProductDescription Herefffffff fffffffff ffffffffff"),
                  )),
              Text("\$2000"),
              Text("100"),
            ],
          ),
        ),
      ],
    );
  }
}
