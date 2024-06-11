import 'package:newuser/app/modules/home/model/submit_rating_request.dart';
import 'package:newuser/app/service/api_end_points.dart';
import 'package:newuser/app/service/base_provider.dart';

class RatingProvider extends BaseProvider {
  Future submitRating({required SubmitRatingRequest request}) async {
    try {
      final response = await post(ApiEndPoints.submit_rating, request.toJson(),
          headers: {"Content-Type": "application/json"});
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return true;
      } 
    } catch (exception) {
      return Future.error(exception);
    }
  }
}
