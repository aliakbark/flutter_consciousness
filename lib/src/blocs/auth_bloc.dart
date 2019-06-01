import 'dart:async';

import 'package:flutter_consciousness/src/blocs/base_bloc.dart';
import 'package:flutter_consciousness/src/utils/constants.dart';
import 'package:flutter_consciousness/src/utils/object_factory.dart';
import 'package:flutter_consciousness/src/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends Object with Validators implements BaseBloc {
  StreamController<bool> _loading = new StreamController<bool>.broadcast();

  Stream<bool> get loadingListener => _loading.stream;

  final _emailController = BehaviorSubject<String>();
  final _mobileController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();

  StreamSink<String> get emailChanged => _emailController.sink;

  StreamSink<String> get passwordChanged => _passwordController.sink;

  StreamSink<String> get mobileChanged => _mobileController.sink;

  StreamSink<String> get nameChanged => _nameController.sink;
  StreamSink<bool> get loadingSink => _loading.sink;

  Stream<String> get mobile =>
      _mobileController.stream.transform(mobileValidator);

  Stream<String> get email => _emailController.stream.transform(emailValidator);

  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  Stream<String> get name => _nameController.stream.transform(nameValidator);

  Stream<bool> get submitCheckSignUp {
    return Observable.combineLatest4(
        mobile, name, email, password, (a, b, c, d) => true);
  }

  Stream<bool> get submitCheckLogin {
    return Observable.combineLatest2(email, password, (a, b) => true);
  }

  @override
  void dispose() {
    _loading?.close();
    _emailController?.close();
    _passwordController?.close();
    _mobileController?.close();
    _nameController?.close();
  }
}

final authBloc = AuthBloc();
