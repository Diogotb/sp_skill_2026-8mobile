// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
//
// import '../widgets/navigator_key.dart';
//
// class InternetProvider extends ChangeNotifier {
//   bool _isConnected = true;
//   late final InternetConnectionChecker _connectionChecker;
//   late final Stream<InternetConnectionStatus> _connectionStream;
//
//   bool get isConnected => _isConnected;
//
//   InternetProvider() {
//     _connectionChecker = InternetConnectionChecker.instance;
//     _connectionStream = _connectionChecker.onStatusChange;
//     _listenConnection();
//   }
//
//   void _listenConnection() {
//     _connectionStream.listen((status) {
//       bool newStatus = status == InternetConnectionStatus.connected;
//       print(newStatus);
//       if (_isConnected != newStatus) {
//         _isConnected = newStatus;
//         notifyListeners();
//         print(newStatus);
//
//         if (!_isConnected) {
//           Future.delayed(Duration.zero, () {
//             navigatorKey.currentState?.pushNamedAndRemoveUntil(
//               '/no-internet',
//                   (route) => false,
//             );
//           });
//         }
//         else {
//           navigatorKey.currentState?.pushNamedAndRemoveUntil(
//             '/home',
//             (route) => false,
//           );
//         }
//       }
//     });
//   }
// }
