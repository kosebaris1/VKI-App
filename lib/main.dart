import 'package:flutter/material.dart';
import 'package:vki_uygulama/view/home_page.dart';


void main() {
  runApp(AnaUygulama());
}

class AnaUygulama extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }

}