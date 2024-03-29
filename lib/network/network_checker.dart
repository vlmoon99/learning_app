// import 'dart:async';
// import 'dart:developer';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_modular/flutter_modular.dart' show Disposable;

// class NetworkChecker extends Disposable {
//   String connectionStatus = 'Unknown';
//   final Connectivity connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;

//   NetworkChecker(){
//     initConnectivity();
//     _connectivitySubscription =
//         connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   Future<void> initConnectivity() async {
//     ConnectivityResult result = ConnectivityResult.none;
//     try {
//       result = await connectivity.checkConnectivity();
//     } on PlatformException catch (e) {
//       log(e.toString());
//     }
//     return _updateConnectionStatus(result);
//   }

//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     switch (result) {
//       case ConnectivityResult.wifi:
//       case ConnectivityResult.mobile:
//       case ConnectivityResult.none:
//         connectionStatus = result.toString();
//         break;
//       default:
//         connectionStatus = 'Failed to get connectivity.';
//         break;
//     }
//   }

//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//   }

// }