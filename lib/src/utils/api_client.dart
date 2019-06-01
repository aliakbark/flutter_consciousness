import 'dart:io';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_consciousness/src/utils/object_factory.dart';

class ApiClient {
  ApiClient() {
    initClient();
  }

  final String _baseUrlDev = 'http://127.0.0.1:8000/';

  Dio _dio;
  Options _options;

  initClient() async {
    _dio = new Dio();
    _dio.options.baseUrl = _baseUrlDev;

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions reqOptions) {
      return reqOptions;
    }, onError: (DioError dioError) {
      return dioError.response;
    }, onResponse: (response) {
      return response;
    }));

    _options = new Options();
    _options.connectTimeout = 5000; //5s
    _options.receiveTimeout = 5000;
    _options.headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json'
    };
  }

  Dio get dio => _dio;

  ///=====================================================
  ///
  /// ====================================================

  //Login
  Future<Response> loginApi(String loginRequestBody) {
    return _dio.post("", data: loginRequestBody);
  }

  //Registration
  Future<Response> registrationApi(String registrationRequestBody) {
    return _dio.post("", data: registrationRequestBody);
  }

  //Check user exist
  Future<Response> checkUserExist(username) {
    Options options = _options;
    options.headers
        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken()});
    return _dio.get("",
        options: options);
  }


}
