import 'package:demo_enterprise_app/common/ui.dart';
import 'package:demo_enterprise_app/mobile/shippingscreen/shipping_screen_presenter.dart';
import 'package:demo_enterprise_app/usecase/post_billing_info_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShippingScreen extends StatefulWidget {
  final BillingInfoRequest billingInfoRequest;

  const ShippingScreen(this.billingInfoRequest,{Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShippingScreenState();
  }
}

class _ShippingScreenState extends State<ShippingScreen> {
  late final ShippingScreenPresenter presenter;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Shipping Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
              onPressed: presenter.onShippingInfoSubmitBtnPresses,
            )
          ],
        ),
      ),
    );

  }

  @override
  void initState() {
    super.initState();
    presenter = ShippingScreenPresenter(widget.billingInfoRequest);
  }

  @override
  void dispose() {
    super.dispose();
    presenter.releaseResources();
  }
}
