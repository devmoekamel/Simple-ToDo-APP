import 'package:appqu/model/model.dart';
import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void  main() {
  
runApp( ToDo());

}

// ignore: use_key_in_widget_constructors
class ToDo extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),


    );
  }
}