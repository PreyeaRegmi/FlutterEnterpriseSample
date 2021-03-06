import 'package:demo_enterprise_app/usecase/validate_billing_and_shipping_address_info_usecase.dart';

abstract class AddressRespository
{
  Future<BillingAndShippingAddressValidationResponse> validate(BillingAndShippingAddressValidationRequest validationRequest);
}