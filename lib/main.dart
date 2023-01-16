import 'package:flutter/material.dart';
import 'package:riderapp/pages/secondpage.dart';
import 'package:riderapp/pages/firstpage.dart';
import 'package:riderapp/pages/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: FirstPage.routeName,
      routes: {
        FirstPage.routeName: (context)=>FirstPage(),
        SecondPage.routeName: (context)=>SecondPage(),
        HomeScreen.routeName: (context)=>HomeScreen(),

      },
    );
  }
}


//https://mocki.io/fake-json-api

