import 'dart:async';

import 'package:demo_enterprise_app/data/shippinginforepository.dart';
import 'package:demo_enterprise_app/usecase/base_usecase.dart';

class ShippingInfoRequest {
  final String phone, city, state,street;

  ShippingInfoRequest(this.phone, this.city, this.state, this.street);
}

class ShippingInfoResponse {
  static ShippingInfoResponse createDummyValue() {
    return ShippingInfoResponse();
  }
}

class PostShippingInfoUseCase extends UseCase<ShippingInfoRequest, ShippingInfoResponse> {
  final ShippingInfoRepository _shippingInfoRepository;

  PostShippingInfoUseCase(this._shippingInfoRepository);

  @override
  Stream<ShippingInfoResponse> buildUseCase(ShippingInfoRequest param) {
    return _shippingInfoRepository.postShippingInfo(param).asStream();
  }
}
