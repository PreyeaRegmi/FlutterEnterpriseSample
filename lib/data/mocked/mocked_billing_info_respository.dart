
import 'package:demo_enterprise_app/usecase/post_billing_info_usecase.dart';

import '../billinginforepository.dart';

class MockedBillingInfoRepository extends BillingInfoRepository
{
  @override
  Future<BillingInfoResponse> postBillingInfo(BillingInfoRequest billingInfoRequest) async {
      return Future.delayed(Duration(milliseconds: 1500),(){
        return Future.value(BillingInfoResponse.createDummyValue());
      });
  }

}