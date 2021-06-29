import 'package:demo_enterprise_app/common/ui.dart';
import 'package:demo_enterprise_app/mobile/billingscreen/billing_screen_presenter.dart';
import 'package:demo_enterprise_app/mobile/shippingscreen/shipping_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BillingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BillingScreenState();
  }
}

class _BillingScreenState extends State<BillingScreen> {
  late final BillingScreenPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Billing Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextInputField(presenter.firstName, "First Name"),
            TextInputField(presenter.lastName, "Last Name"),
            TextInputField(presenter.email, "Email"),
            TextInputField(presenter.address, "Billing Address"),
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
              onPressed: presenter.onBillingInfoSubmitBtnPresses,
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    presenter = BillingScreenPresenter();
    presenter.billingActionResultNotifier.listen((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShippingScreen(value),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    presenter.releaseResources();
  }
}
