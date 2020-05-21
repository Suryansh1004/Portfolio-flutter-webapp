import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myweb/profile_page.dart';

void main(){
  runApp(MyApp());
  }
  
 class MyApp extends StatelessWidget {
   const MyApp({Key key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData(
         brightness: Brightness.dark,
         primaryColor: Colors.black,
         fontFamily: "GoogleSansRegular",
       ),
       home: ProfilePage(),
    );
   }
 }
