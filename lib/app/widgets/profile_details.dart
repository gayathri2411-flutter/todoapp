
import 'package:rxdart/rxdart.dart';
class ProfileDetails {
  final profileDetail = BehaviorSubject.seeded({});
  Stream get stream => profileDetail.stream;
  get current => profileDetail.value;
  setUser(v) {
    profileDetail.add(v);
    
  }
}