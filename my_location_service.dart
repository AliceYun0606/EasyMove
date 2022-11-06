import 'package:geolocator/geolocator.dart';
import 'package:cron/cron.dart';

class MyLocationService{
  static final MyLocationService _instance = MyLocationService._internal();
  final List<Position> _positions = <Position>[];
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  final Cron _cron = Cron();

  factory MyLocationService(){
    return _instance;
  }

  MyLocationService._internal();

  /// Start the automatic update of location every 1 minute.
  Future<void> start() async {
    final hasPermission = await _handlePermission();
    if (!hasPermission) {
      return;
    }
    _cron.schedule(Schedule.parse('* * * * *'), () => _updatePosition());
  }

  /// Stop automatic update of location.
  void stop(){
    _cron.close();
  }

  /// Get the latest recorded position.
  Position? getLastKnownPosition(){
    if(_positions.isNotEmpty) {
      return _positions.last;
    }
    return null;
  }

  /// Get the current position.
  Future<Position> getCurrentPosition() async {
    final position = await _geolocatorPlatform.getCurrentPosition();
    return position;
  }

  /// Get the list of recorded positions.
  List<Position> getPositions(){
    return _positions;
  }

  /// Calculate and return the distance between the specified start point and end point in meters.
  /// [startLat] and [startLong] are latitude and longitude of start point.
  /// [endLat] and [endLong] are latitude and longitude of end point.
  double distanceInMeter(double startLat, double startLong, double endLat, double endLong){
    return _geolocatorPlatform.distanceBetween(startLat, startLong, endLat, endLong);
  }

  Future<void> _updatePosition() async {
    final position = await _geolocatorPlatform.getCurrentPosition();
    _positions.add(position);
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

}