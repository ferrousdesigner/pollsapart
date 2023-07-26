import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _currentCategory =
          prefs.getString('ff_currentCategory') ?? _currentCategory;
    });
    _safeInit(() {
      _activeTab = prefs.getString('ff_activeTab') ?? _activeTab;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _currentCategory = 'AI';
  String get currentCategory => _currentCategory;
  set currentCategory(String _value) {
    _currentCategory = _value;
    prefs.setString('ff_currentCategory', _value);
  }

  String _activeTab = 'new';
  String get activeTab => _activeTab;
  set activeTab(String _value) {
    _activeTab = _value;
    prefs.setString('ff_activeTab', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
