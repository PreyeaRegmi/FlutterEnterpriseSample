import 'package:demo_enterprise_app/usecase/base_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_billing_info_usecase.dart';
import 'package:demo_enterprise_app/usecase/post_shipping_info_usecase.dart';
import 'package:rxdart/rxdart.dart';

class BillingShippingInfoRequest {
  final BillingInfoRequest billingInfoRequest;
  final ShippingInfoRequest shippingInfoRequest;

  BillingShippingInfoRequest(
      this.billingInfoRequest, this.shippingInfoRequest);
}

class BillingShippinInfoResponse {
  static from(
      BillingInfoResponse billingResult, ShippingInfoResponse shippingResult) {
    return BillingShippinInfoResponse();
  }
}

class PostBillingAndShippingInfoUseCase
    extends UseCase<BillingShippingInfoRequest, BillingShippinInfoResponse> {
  final PostBillingInfoUseCase _postBillingInfoUseCase;
  final PostShippingInfoUseCase _postShippingInfoUseCase;

  PostBillingAndShippingInfoUseCase(
      this._postBillingInfoUseCase, this._postShippingInfoUseCase);

  @override
  Stream<BillingShippinInfoResponse> buildUseCase(
      BillingShippingInfoRequest param) {
    return Rx.zip2(
        _postBillingInfoUseCase.buildUseCase(param.billingInfoRequest),
        _postShippingInfoUseCase.buildUseCase(param.shippingInfoRequest),
        (BillingInfoResponse billingResult,
                ShippingInfoResponse shippingResult) =>
            BillingShippinInfoResponse.from(billingResult, shippingResult));
  }
}
