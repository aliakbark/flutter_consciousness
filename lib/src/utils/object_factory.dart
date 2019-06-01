import 'package:flutter_consciousness/src/resources/repository/repository.dart';
import 'package:flutter_consciousness/src/utils/api_client.dart';
import 'package:flutter_consciousness/src/utils/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ObjectFactory {
  static final _objectFactory = ObjectFactory._internal();

  ObjectFactory._internal();

  factory ObjectFactory() => _objectFactory;

  //Initialisation of Objects
  Prefs _prefs = Prefs();
  ApiClient _apiClient = ApiClient();
  Repository _repository = Repository();

  ///
  /// Getters of Objects
  ///
  ApiClient get apiClient => _apiClient;

  Prefs get prefs => _prefs;


  Repository get repository => _repository;

  ///
  /// Setters of Objects
  ///
  void setPrefs(SharedPreferences sharedPreferences) {
    _prefs.sharedPreferences = sharedPreferences;
  }
}
