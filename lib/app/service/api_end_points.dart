class ApiEndPoints {
  static const String DUMMY = "dummy/list";
  static const String LOGIN = "login/mindorks";
  static const String HOME_POSTS_LIST = "driver/post/list";
  static const String POST_LIKE = "driver/post/like";
  static const String POST_UNLIKE = "driver/post/unlike";
  static const String GET_IMAGE_BY_ID = "/driver-photo/id/";
  static const String ADD_PHOTO = "/driver-photo";
  static const String INDIA_FORGOT_SMS ="/mobileVerification/app/phoneNumber/v1/twillo/forgotPassword/sms";
  static const String FORGET_PASSWORD_REQ_OTP ="/mobileVerification/app/phoneNumber/v1/twillo/sms";
  static const String SEARCH_API = "/search/v1/image/advanceSearch";
  static const String VEHICLES_LATLNG_API = "/search/v2/image/advanceSearch";
  static const String BOOKING_API ="/notification/tripId/all/user/back/todevice";
  static const String COUPON_BOOKING_API ="/notification/v1/tripId/all/user/back/todevice";
  static const String ENDPOINT_CHECK_WALLET_BALANCE ="/wallet/app/v1/find/{userId}";
  static const String ENDPOINT_CHECK_WALLET_ADD = "/wallet/app/v1/add";
  static const String ENDPOINT_CHECK_WALLET_TOKENCHECK ="/wallet/app/v1/find/token/{token}";
  static const String ENDPOINT_SERVER_ForgetPassword ="/app/user/v1/forgotpassword/retrieve/{email}";
  static const String ENDPOINT_SERVER_TaxiDetails ="/taxi/app/taxi/v1/details/{taxiId}";
  static const String ENDPOINT_SERVER_UserDetails ="/logout/app/userDetail/v1/";
  static const String ENDPOINT_SERVER_CheckUserImage ="/logout/app/userDetail/v2/";
  static const String ENDPOINT_SERVER_VehicleInfo ="/vehicleType/app/taxi/v1/type/updateInfo";
  static const String ENDPOINT_SERVER_ProfileUpdate ="/logout/app/user/v2/update";
  static const String ENDPOINT_SERVER_ProfileImage = "/driver-photo";
  static const String ENDPOINT_SERVER_LOGIN ="/userLogin/app/user/v1/mobile/user/login";
  static const String ENDPOINT_RIDE_CREATE = "/ride/v1/dummy/add";
  static const String ENDPOINT_RIDE_STATUS_WITHREASON = "/ride/v2/dummy/add";
  static const String ENDPOINT_SEND_MESSAGES = "/app/message/v1/create";
  static const String ENDPOINT_STATUS_UPDATE ="/search/app/taxi/v1/status/{taxiId}/{userId}/{latitude}/{longitude}/{driverStatus}";
  static const String ENDPOINT_DRIVERBILL_TOTAL_AMOUNT ="/app/driverBilling/v1/{supplierId}/{driverId}";
  static const String ENDPOINT_FEEDBACK = "/contact/app/mail/create";
  static const String ENDPOINT_RATE_US = "/contact/app/mail/create";
  static const String ENDPOINT_REVIEW = "/review/v1/add";
  static const String ENDPOINT_LOGOUT ="/logout/app/admin/user/v1/loginStatus";
  static const String ENDPOINT_STATUS_UPDATE_LANGUAGE ="/app/user/v1/language/update/{userId}/{language}";
  static const String ENDPOINT_OTP_REQ ="/mobileVerification/app/phoneNumber/v1/twillo/new/sms";
  static const String ENDPOINT_RIDE_OTP_SMS_TO_USER ="/mobileVerification/app/phoneNumber/v1/twillo/ride/verification/sms";
  static const String ENDPOINT_VALIDATE_OTP_REQ ="/mobileVerification/app/user/twillo/v1/token";
  static const String ENDPOINT_VALIDATE_RIDE_OTP_REQ ="/mobileVerification/app/user/twillo/v1/ride/token";
  static const String ENDPOINT_CONFIG = "/app/config/getAll";
  static const String ENDPOINT_UPDATE_REVIEW = "/app/review/v1/create";
  static const String ENDPOINT_TRIP_HISTORY = "https://india.taxideals.online/ride/app/v1/user/get";
  static const String ENDPOINT_FAV_PLACE = "/app/taxi/v1/search/{code}";
  static const String ENDPOINT_TRIP_INVOICE ="/ride/app/ride/v1/invoice/{rideId}";
  static const String ENDPOINT_SIGNUP_REQ ="/userLogin/app/user/v1/mobile/full/registration";
  static const String ENDPOINT_FCM_TOKEN = "/user/v1/find/id/token";
  static const String ENDPOINT_UPDATE_PRICE_KM ="/ride/app/v1/rideUpdateFinished/gps/";
  static const String ENDPOINT_FCM_REQUEST =
      "https://fcm.googleapis.com/fcm/send";
  static const String UPDATE_MOBILE_REQ_OTP =
      "/app/phoneNumber/v1/twillo/update/sms";
  static const String VALIDATE_MOBILE_REQ_OTP =
      "/app/user/twillo/v1/password/token";
  static const String VALIDATE_UPDATED_MOBILE_REQ_OTP =
      "/app/user/twillo/v1/updateNumber/token";
  static const String ENDPOINT_CHANGES_DES =
      "/app/ride/v1/rideUpdates/changeDest/{rideId}/{dest}";
  static const String OFFLINE_BOOKING_SMS =
      "/phoneBooking/app/phoneBooking/v1/userOffline/sms/create";
  static const String OFFLINE_BOOKING_SMS_FINAL =
      "/app/phoneBooking/v1/userOffline/final/create";
  static const String USER_OFFLINE =
      "/phoneBooking/app/phoneBooking/v1/userOffline/create";
  static const String PRICE_CALCULATION =
      "/ride/app/v1/PriceCalculation/gps/";
  static const String CHECK_COUPON = "/coupan/v1/find/supplierId/{coupon}";
  static const String ENDPOINTS_TOGET_AMOUNT = "/billing/v1/get/{id}";
  static const String COUPON_PRICE = "/coupan/v1/find/copon/{coupon}/{amount}";
  static const String FBLOGIN = "/social/app/v1/add/user";
  static const fcmToken="https://fcm.googleapis.com/fcm/send";
  static const submit_rating="/review/app/v1/add";
}
