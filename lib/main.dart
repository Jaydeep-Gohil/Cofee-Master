import 'package:coffee_master/datamanager.dart';
import 'package:coffee_master/pages/menuPage.dart';
import 'package:coffee_master/pages/offerpages.dart';
import 'package:coffee_master/pages/orderPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Master',
      theme: ThemeData(
        primarySwatch: Colors.brown, // brown theme
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dataManaegr =  DataManager();
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    Widget currenrWidgetPage = Text("!!");
    switch (selectedIndex) {
      case 0:
        currenrWidgetPage = menuPage(dataManager: dataManaegr);
        break;
      case 1:
        currenrWidgetPage = Offerpages();
        break;
      case 2:
        currenrWidgetPage = orderPage(dataManager: dataManaegr);
        break;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Center(
          child: Image.asset(
            "images/logo.png",
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:selectedIndex,
          onTap: (newIndex){
          setState(() {
            selectedIndex = newIndex;
          });
          },
          backgroundColor: Colors.brown,
          selectedItemColor: Colors.yellow.shade400,
          unselectedItemColor: Colors.brown.shade50,
          items: [
        BottomNavigationBarItem(label: "Menu",icon: Icon(Icons.coffee)),
        BottomNavigationBarItem(label: "Offers",icon: Icon(Icons.local_offer)),
        BottomNavigationBarItem(label: "Order",icon: Icon(Icons.shopping_cart_checkout_outlined)),
      ]),
      body:currenrWidgetPage // your custom widget
    );
  }
}
