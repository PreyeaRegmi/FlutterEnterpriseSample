import 'package:demo_enterprise_app/web/billingshippingscreen/billing_shipping_screen.dart';
import 'package:flutter/material.dart';

void main() {
  //Set platform specific initialization
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkout Process Demo - Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BillingShippingScreen(),
    );
  }
}


