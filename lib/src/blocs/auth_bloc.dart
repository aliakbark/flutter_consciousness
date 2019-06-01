import 'dart:async';

import 'package:flutter_consciousness/src/blocs/base_bloc.dart';
import 'package:flutter_consciousness/src/utils/constants.dart';
import 'package:flutter_consciousness/src/utils/object_factory.dart';
import 'package:flutter_consciousness/src/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends Object with Validators implements BaseBloc {
  StreamController<bool> _loading = new StreamController<bool>.broadcast();

  Stream<bool> get loadingListener => _loading.stream;

  final _mobileController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  StreamSink<String> get mobileChanged => _mobileController.sink;

  Stream<String> get mobile =>
      _mobileController.stream.transform(mobileValidator);


  @override
  void dispose() {
    _loading?.close();

    _mobileController?.close();
  }
}

final authBloc = AuthBloc();
