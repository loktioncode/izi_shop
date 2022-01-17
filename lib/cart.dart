import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cart extends StatelessWidget {
  static const routeName = '/search';
  const Cart({Key? key}) : super(key: key);

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
          // cart items show here
          ),
    );
  }
}
