import 'package:rxdart/rxdart.dart';

class BookRide {
  BehaviorSubject<int> rideStatus = BehaviorSubject.seeded(0);

  Stream get stream => rideStatus.stream;
  get current => rideStatus.value;
  setStatus(v) {
    rideStatus.add(v);
  }
} 
