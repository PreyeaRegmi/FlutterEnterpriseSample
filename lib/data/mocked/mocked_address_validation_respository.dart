import 'package:demo_enterprise_app/data/addressrepository.dart';
import 'package:demo_enterprise_app/usecase/post_billing_info_usecase.dart';
import 'package:demo_enterprise_app/usecase/validate_billing_and_shipping_address_info_usecase.dart';

import '../billinginforepository.dart';

class MockedAddressValidationRepository extends AddressRespository {
  @override
  Future<BillingAndShippingAddressValidationResponse> validate(
      BillingAndShippingAddressValidationRequest validationRequest) async {
    return Future.delayed(Duration(milliseconds: 1500), () {
      return Future.value(
          BillingAndShippingAddressValidationResponse.createDummyValue());
    });
  }
}
