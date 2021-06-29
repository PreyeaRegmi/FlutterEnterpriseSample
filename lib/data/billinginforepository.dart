
import 'package:demo_enterprise_app/data/base_respository.dart';
import 'package:demo_enterprise_app/usecase/post_billing_info_usecase.dart';

abstract class BillingInfoRepository extends BaseRepository
{
  Future<BillingInfoResponse> postBillingInfo(BillingInfoRequest billingInfoRequest);
}