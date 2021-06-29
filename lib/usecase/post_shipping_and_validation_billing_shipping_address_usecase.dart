import 'package:demo_enterprise_app/usecase/base_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_shipping_info_usecase.dart';
import 'package:demo_enterprise_app/usecase/validate_billing_and_shipping_address_info_usecase.dart';
import 'package:rxdart/rxdart.dart';

class PostShippingAndValidationAddressRequest {
  final ShippingInfoRequest _shippingInfoRequest;
  final BillingAndShippingAddressValidationRequest _addressValidationRequest;

  PostShippingAndValidationAddressRequest(
      this._shippingInfoRequest, this._addressValidationRequest);
}

class PostShippingAndValidationBillingShippingAddress extends UseCase<
    PostShippingAndValidationAddressRequest,
    BillingAndShippingAddressValidationResponse> {
  final PostShippingInfoUseCase _postShippingInfoUseCase;
  final ValidateBillingAndShippingAddressUseCase
      _billingAndShippingAddressUseCase;

  PostShippingAndValidationBillingShippingAddress(
      this._postShippingInfoUseCase, this._billingAndShippingAddressUseCase);

  @override
  Stream<BillingAndShippingAddressValidationResponse> buildUseCase(
      PostShippingAndValidationAddressRequest param) {
    return _postShippingInfoUseCase
        .buildUseCase(param._shippingInfoRequest)
        .flatMap((shippingResponse) => _billingAndShippingAddressUseCase
            .buildUseCase(param._addressValidationRequest));
  }
}
