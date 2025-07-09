import 'dart:developer';
import 'dart:io'; // For InternetAddress lookup
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:events/core/services/network_checker_interface.dart';

class ConnectivityService implements  NetworkChecker {
  // Singleton pattern to ensure only one instance of the service
  static final ConnectivityService _instance = ConnectivityService._internal();
  factory ConnectivityService() => _instance;
  ConnectivityService._internal();

  final Connectivity _connectivity = Connectivity();

  /// Checks if the device has an active internet connection.
  /// Returns true if connected, false otherwise.
  Future<bool> hasInternetConnection() async {
    try {
      // Step 1: Check connectivity status
      final connectivityResult = await _connectivity.checkConnectivity();

      // If no connectivity, return false
      if (connectivityResult == ConnectivityResult.none) {
        log("connectivity result : false ");
        return false;
      }

      log("connectivity result :  true but still look up ");

      // Step 2: Verify actual internet access by performing a lookup
      // (ConnectivityResult.wifi or .mobile doesn't guarantee internet)
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
            log("connectivity result :  socketException from the look up ");

      // SocketException indicates no internet
      return false;
    } catch (e) {
      print('Error checking internet connection: $e');
      return false;
    }
  }

  /// Stream to listen for connectivity changes (optional)
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;
}
