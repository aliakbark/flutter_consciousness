import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  SharedPreferences _sharedPreferences;

  static const String _USERNAME = "username";
  static const String _USER_ID = "user_id";

  static const String _AUTH_TOKEN = "auth_token";

  static const String _IS_LOGGED_IN = "is_logged_in";

  static const String _IS_OFFLINE_DATA_LOADED = "is_offline_data_loaded";

  Prefs();

  set sharedPreferences(SharedPreferences value) {
    _sharedPreferences = value;
  }

//  void saveModel(Product product) {
//    String jsonString = json.encode(product);
//    _sharedPreferences.setString(_THEME_KEY, jsonString);
//  }
//
//  Product getModel() {
//    Map productMap = json.decode(_THEME_KEY);
//    var product = new Product.fromJson(productMap);
//    return product;
//  }

  void setUsername({String username}) {
    _sharedPreferences.setString(_USERNAME, username);
  }

  String getUsername() => _sharedPreferences.getString(_USERNAME);

  void setAuthToken({String token}) {
    _sharedPreferences.setString(_AUTH_TOKEN, "Token " + token);
  }

  String getAuthToken() => _sharedPreferences.getString(_AUTH_TOKEN);

  void setUserId(int userId) {
    _sharedPreferences.setInt(_USER_ID, userId);
  }

  int getUserId() => _sharedPreferences.getInt(_USER_ID);

  void setIsLoggedIn(bool status) {
    _sharedPreferences.setBool(_IS_LOGGED_IN, status);
  }

  bool isLoggedIn() => _sharedPreferences.getBool(_IS_LOGGED_IN) != null &&
          _sharedPreferences.getBool(_IS_LOGGED_IN)
      ? true
      : false;

  void clearPrefs() {
    _sharedPreferences.clear();
  }

  void setIsOfflineDataLoaded(bool status) {
    _sharedPreferences.setBool(_IS_OFFLINE_DATA_LOADED, status);
  }

  bool isOfflineDataLoaded() =>
      _sharedPreferences.getBool(_IS_OFFLINE_DATA_LOADED) != null &&
              _sharedPreferences.getBool(_IS_OFFLINE_DATA_LOADED)
          ? true
          : false;
}
