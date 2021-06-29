
import 'package:demo_enterprise_app/data/shippinginforepository.dart';
import 'package:demo_enterprise_app/usecase/post_shipping_info_usecase.dart';

class MockedShippingInfoRepository extends ShippingInfoRepository
{
  @override
  Future<ShippingInfoResponse> postShippingInfo(ShippingInfoRequest billingInfoRequest) async {
      return Future.delayed(Duration(milliseconds: 1500),(){
        return Future.value(ShippingInfoResponse.createDummyValue());
      });
  }

}