// main.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    );
  }
}
