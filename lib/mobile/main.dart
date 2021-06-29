import 'package:demo_enterprise_app/mobile/billingscreen/billing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  //Set platform specific initialization
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkout Process Demo - Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BillingScreen(),
    );
  }
}


