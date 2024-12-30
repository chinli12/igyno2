import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _apikey =
      'YjJ0aFptOXlZMmhwWW5WNmIzSTJPREJBWjIxaGFXd3VZMjl0Om1xZmNjckNzejRmRHB1UThZX1lRMw==';
  String get apikey => _apikey;
  set apikey(String value) {
    _apikey = value;
  }

  bool _isnow = false;
  bool get isnow => _isnow;
  set isnow(bool value) {
    _isnow = value;
  }

  bool _isVideoPlaying = false;
  bool get isVideoPlaying => _isVideoPlaying;
  set isVideoPlaying(bool value) {
    _isVideoPlaying = value;
  }

  String _videoURL = '';
  String get videoURL => _videoURL;
  set videoURL(String value) {
    _videoURL = value;
  }
}
