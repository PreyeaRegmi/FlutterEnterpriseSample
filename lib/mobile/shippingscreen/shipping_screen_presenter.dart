import 'package:demo_enterprise_app/common/base_presenter.dart';
import 'package:demo_enterprise_app/data/mocked/mocked_address_validation_respository.dart';
import 'package:demo_enterprise_app/data/mocked/mocked_shipping_info_respository.dart';
import 'package:demo_enterprise_app/usecase/post_billing_and_shipping_info_and_validate_address_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_billing_info_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_shipping_and_validation_billing_shipping_address_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_shipping_info_usecase.dart';
import 'package:demo_enterprise_app/usecase/validate_billing_and_shipping_address_info_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class ShippingScreenPresenter extends BasePresenter {
  final TextEditingController phone;
  final TextEditingController city;
  final TextEditingController state;
  final TextEditingController street;
  final BillingInfoRequest billingInfoRequest;
  final CompositeSubscription useCaseSubs;

  ShippingScreenPresenter(this.billingInfoRequest)
      : useCaseSubs = CompositeSubscription(),
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

  void onShippingInfoSubmitBtnPresses() {
    if (validateBillingInfoRequest()) {
      // Before validation requirement was added
      // proceedToSubmitShippingInfo(ShippingInfoRequest(phone.value.text,
      //     city.value.text, state.value.text, street.value.text));

      //After validation requirement was added
      proceedToSubmitShippingInfoAndValidateAddressAfterwards(
          ShippingInfoRequest(phone.value.text, city.value.text,
              state.value.text, street.value.text));
    } else
      showToast("Please provide correct data.");
  }

  bool validateBillingInfoRequest() {
    return true;
  }

  void proceedToSubmitShippingInfo(ShippingInfoRequest shippingInfoRequest) {
    useCaseSubs.add(PostShippingInfoUseCase(MockedShippingInfoRepository())
        .execute(shippingInfoRequest, (result) {
      showToast("Shipping Information Submitted Successfully");
    }, (errorMessage) {
      showToast(errorMessage);
    }));
  }

  void proceedToSubmitShippingInfoAndValidateAddressAfterwards(
      ShippingInfoRequest shippingInfoRequest) {
    useCaseSubs.add(PostShippingAndValidationBillingShippingAddress(
            PostShippingInfoUseCase(MockedShippingInfoRepository()),
            ValidateBillingAndShippingAddressUseCase(
                MockedAddressValidationRepository()))
        .execute(
            PostShippingAndValidationAddressRequest(
                shippingInfoRequest,
                BillingAndShippingAddressValidationRequest(
                    billingInfoRequest, shippingInfoRequest)), (result) {
      showToast("Shipping Information Submitted Successfully");
    }, (errorMessage) {
      showToast(errorMessage);
    }));
  }
}
