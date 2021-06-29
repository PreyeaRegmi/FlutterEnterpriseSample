import 'package:demo_enterprise_app/usecase/base_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_billing_and_shipping_info_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_billing_info_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_shipping_info_usecase.dart';
import 'package:demo_enterprise_app/usecase/validate_billing_and_shipping_address_info_usecase.dart';
import 'package:rxdart/rxdart.dart';

import 'post_billing_and_shipping_info_usecase.dart';

class PostBillingShippingInfoAndValidateAddressUseCase extends UseCase<
    BillingShippingInfoRequest, BillingAndShippingAddressValidationResponse> {
  final PostBillingInfoUseCase _billingInfoUseCase;
  final PostShippingInfoUseCase _shippingInfoUseCase;
  final ValidateBillingAndShippingAddressUseCase
      _billingAndShippingAddressValidationUseCase;

  PostBillingShippingInfoAndValidateAddressUseCase(
    this._billingInfoUseCase,
    this._shippingInfoUseCase,
    this._billingAndShippingAddressValidationUseCase,
  );

  @override
  Stream<BillingAndShippingAddressValidationResponse> buildUseCase(
      BillingShippingInfoRequest param) {
    return Rx.zip2(
            _billingInfoUseCase.buildUseCase(param.billingInfoRequest),
            _shippingInfoUseCase.buildUseCase(param.shippingInfoRequest),
            (BillingInfoResponse billingResult,
                    ShippingInfoResponse shippingResult) =>
                BillingShippinInfoResponse.from(billingResult, shippingResult))
        .flatMap((billingShippingResult) =>
            _billingAndShippingAddressValidationUseCase
                .buildUseCase(BillingAndShippingAddressValidationRequest(param.billingInfoRequest,param.shippingInfoRequest)));
  }
}
