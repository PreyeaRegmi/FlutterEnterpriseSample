
import 'package:demo_enterprise_app/data/base_respository.dart';
import 'package:demo_enterprise_app/usecase/post_shipping_info_usecase.dart';

abstract class ShippingInfoRepository extends BaseRepository
{
  Future<ShippingInfoResponse> postShippingInfo(ShippingInfoRequest shippingInfoRequest);
}