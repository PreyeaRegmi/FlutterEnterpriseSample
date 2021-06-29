import 'dart:async';

import 'package:demo_enterprise_app/data/addressrepository.dart';
import 'package:demo_enterprise_app/data/billinginforepository.dart';
import 'package:demo_enterprise_app/usecase/base_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_billing_and_shipping_info_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_billing_info_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_shipping_info_usecase.dart';

class BillingAndShippingAddressValidationRequest {
  final BillingInfoRequest billingInfoRequest;
  final ShippingInfoRequest shippingInfoRequest;

  BillingAndShippingAddressValidationRequest(
      this.billingInfoRequest, this.shippingInfoRequest);


}

class BillingAndShippingAddressValidationResponse {
  final String address;

  BillingAndShippingAddressValidationResponse(this.address);

  static BillingAndShippingAddressValidationResponse createDummyValue() {
    return BillingAndShippingAddressValidationResponse("");
  }

  @override
  String toString() {
    return this.address;
  }
}

class ValidateBillingAndShippingAddressUseCase extends UseCase<
    BillingAndShippingAddressValidationRequest,
    BillingAndShippingAddressValidationResponse> {
  final AddressRespository _addressRespository;

  ValidateBillingAndShippingAddressUseCase(this._addressRespository);

  @override
  Stream<BillingAndShippingAddressValidationResponse> buildUseCase(
      BillingAndShippingAddressValidationRequest param) {
    return _addressRespository.validate(param).asStream();
  }
}
