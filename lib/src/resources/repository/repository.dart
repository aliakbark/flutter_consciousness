import 'dart:io';

import 'package:flutter_consciousness/src/resources/api_providers/auth_api_provider.dart';
import 'package:flutter_consciousness/src/resources/api_providers/data_provider.dart';

class Repository {
  final authApiProvider = AuthApiProvider();
  final dataProvider = DataProvider();
//
//  Future<LoginResponse> login(LoginRequest loginRequest) =>
//      authApiProvider.login(loginRequest);




}