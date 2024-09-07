import 'package:flutter/material.dart';
import 'package:crud_2/HomeScreen.dart';
void main(){
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomeScreen(),
      title: "crud",
      theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green,width: 3,)
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey,width:1,)
            ),
          ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.green)
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}