import 'dart:async';

import 'package:demo_enterprise_app/data/billinginforepository.dart';
import 'package:demo_enterprise_app/usecase/base_usecase.dart';

class BillingInfoRequest {
  final String firstName,lastName,email,address;

  BillingInfoRequest(this.firstName, this.lastName, this.email, this.address);
}

class BillingInfoResponse {
  final String billId;

  BillingInfoResponse(this.billId);

  static BillingInfoResponse createDummyValue() {
    return BillingInfoResponse("123");
  }
}

class PostBillingInfoUseCase
    extends UseCase<BillingInfoRequest, BillingInfoResponse> {
  final BillingInfoRepository _billingInfoRepository;

  PostBillingInfoUseCase(this._billingInfoRepository);

  @override
  Stream<BillingInfoResponse> buildUseCase(BillingInfoRequest param) {
    return _billingInfoRepository.postBillingInfo(param).asStream();
  }
}
