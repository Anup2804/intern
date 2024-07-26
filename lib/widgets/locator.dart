import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocatorWidget {
  static Future<String> fetchPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Location service is disabled.');
      return 'Location service is disabled';
    }
    
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'You denied permission');
        return 'Permission denied';
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'Permission denied forever.');
      return 'Permission denied forever';
    }
    Position currentPosition = await Geolocator.getCurrentPosition();

    // Fetch address from coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(currentPosition.latitude, currentPosition.longitude);

    // Extract the first address from the list of placemarks
    Placemark placemark = placemarks.first;

    return "${placemark.street}, ${placemark.locality}, ${placemark.country}";
  }
}

