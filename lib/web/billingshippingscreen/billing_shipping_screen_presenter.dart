import 'package:demo_enterprise_app/common/base_presenter.dart';
import 'package:demo_enterprise_app/data/mocked/mocked_address_validation_respository.dart';
import 'package:demo_enterprise_app/data/mocked/mocked_billing_info_respository.dart';
import 'package:demo_enterprise_app/data/mocked/mocked_shipping_info_respository.dart';
import 'package:demo_enterprise_app/usecase/post_billing_and_shipping_info_and_validate_address_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_billing_and_shipping_info_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_billing_info_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_shipping_info_usecase.dart';
import 'package:demo_enterprise_app/usecase/validate_billing_and_shipping_address_info_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class BillingShippingScreenPresenter extends BasePresenter {
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController address;
  final TextEditingController phone;
  final TextEditingController city;
  final TextEditingController state;
  final TextEditingController street;
  final CompositeSubscription useCaseSubs;

  BillingShippingScreenPresenter()
      : useCaseSubs = CompositeSubscription(),
        firstName = TextEditingController(),
        lastName = TextEditingController(),
        email = TextEditingController(),
        address = TextEditingController(),
        phone = TextEditingController(),
        city = TextEditingController(),
        state = TextEditingController(),
        street = TextEditingController(),
        super();

  @override
  void releaseResources() {
    phone.dispose();
    city.dispose();
    state.dispose();
    street.dispose();
    useCaseSubs.dispose();
  }

  void onBillingShippingInfoSubmitBtnPresses() {
    if (validateBillingInfoRequest()) {
      proceedToSubmitShippingInfo(BillingShippingInfoRequest(
          BillingInfoRequest(firstName.value.text, lastName.value.text,
              email.value.text, address.value.text),
          ShippingInfoRequest(phone.value.text, city.value.text,
              state.value.text, street.value.text)));
    } else
      showToast("Please provide correct data.");
  }

  bool validateBillingInfoRequest() {
    return true;
  }

  void proceedToSubmitShippingInfo(
      BillingShippingInfoRequest billingShippingInfoRequest) {
    useCaseSubs.add(PostBillingAndShippingInfoUseCase(
            PostBillingInfoUseCase(MockedBillingInfoRepository()),
            PostShippingInfoUseCase(MockedShippingInfoRepository()))
        .execute(billingShippingInfoRequest, (result) {
      showToast("Billing and Shipping Information Submitted Successfully");
    }, (errorMessage) {
      showToast(errorMessage);
    }));
  }

  void proceedToSubmitBillingShippingInfoAndValidateAddressAfterwards(
      BillingShippingInfoRequest billingShippingInfoRequest) {
    useCaseSubs.add(PostBillingShippingInfoAndValidateAddressUseCase(
            PostBillingInfoUseCase(MockedBillingInfoRepository()),
            PostShippingInfoUseCase(MockedShippingInfoRepository()),
            ValidateBillingAndShippingAddressUseCase(
                MockedAddressValidationRepository()))
        .execute(billingShippingInfoRequest, (result) {
      showToast("Billing and Shipping Information Submitted Successfully");
    }, (errorMessage) {
      showToast(errorMessage);
    }));
  }
}
