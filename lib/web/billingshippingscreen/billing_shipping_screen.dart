import 'package:demo_enterprise_app/common/ui.dart';
import 'package:demo_enterprise_app/web/billingshippingscreen/billing_shipping_screen_presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BillingShippingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BillingShippingScreenState();
  }
}

class _BillingShippingScreenState extends State<BillingShippingScreen> {
  late final BillingShippingScreenPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Billin and Shipping"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Billing Info"),
            TextInputField(presenter.firstName, "First Name"),
            TextInputField(presenter.lastName, "Last Name"),
            TextInputField(presenter.email, "Email"),
            TextInputField(presenter.address, "Billing Address"),
            Container(
              width: double.infinity,
              height: 50,
            ),
            Text("Shipping Info"),
            TextInputField(presenter.phone, "Phone"),
            TextInputField(presenter.city, "City"),
            TextInputField(presenter.state, "State"),
            TextInputField(presenter.street, "Street"),
            Container(
              width: double.infinity,
              height: 40,
            ),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: presenter.onBillingShippingInfoSubmitBtnPresses,
            )
          ],
        ),
      ),
    );

  }

  @override
  void initState() {
    super.initState();
    presenter = BillingShippingScreenPresenter();
  }

  @override
  void dispose() {
    super.dispose();
    presenter.releaseResources();
  }
}
