// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool?> netWork() async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  try {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // No network connection
      return false;
    }
    // Connected to a network (Wi-Fi or Mobile Data)
    return true;
  } catch (e) {
    // Handle potential errors
    return null; // Return null in case of an exception
  }

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
