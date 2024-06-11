import 'package:newuser/app/modules/home/model/booking_request.dart';
import 'package:newuser/app/modules/home/model/booking_response.dart';
import 'package:newuser/app/modules/home/model/price_calculation_request.dart';
import 'package:newuser/app/modules/home/model/price_calculation_response.dart';
import 'package:newuser/app/modules/home/model/profile_details_response.dart';
import 'package:newuser/app/modules/home/model/search_cab_request.dart';
import 'package:newuser/app/modules/home/model/search_cab_response.dart';
import 'package:newuser/app/modules/home/model/userDetails_response.dart';
import 'package:newuser/app/service/provider.dart';

class HomeRepository {
  final Provider provider;

  HomeRepository({required this.provider});
  Future<UserDetailsResponse> userDetails() async =>
      await provider.userDetails();
       Future<Profile_Details_Response> profileDetails() async =>
      await provider.profileDetails();
      // Future<AdvanceSearch_v1_Response> advanceSearchV1({required AdvanceSearch_v1_Request request}) async =>
      // await provider.advanceSearchV1(request: request);
      Future<SearchCabResponse> advanceSearchV2({required SearchCabRequest request}) async =>
      await provider.advanceSearchV2(request: request);
      Future<PriceCalculationResponse> priceCalculation({required PriceCalculationRequest request}) async => provider.priceCalculation(request: request);
      Future<Booking_Response> booking({required Booking_Request request}) async =>
      await provider.booking(request: request);
      
}
