import 'dart:async';
import 'package:validators/validators.dart';

mixin Validators {
  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (isEmail(email)) {
      sink.add(email);
    } else {
      sink.addError("Email is not valid");
    }
  });

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 8) {
      sink.add(password);
    } else {
      sink.addError("Password length should be greater than 8 chars.");
    }
  });

  var mobileValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (mobile, sink) {
    if (isInt(mobile)) {
      if (mobile.length == 10) {
        sink.add(mobile);
      } else {
        sink.addError("Invalid mobile number");
      }
    }
  });

  var nameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.isNotEmpty) {
      sink.add(name);
    } else {
      sink.addError("Invalid name");
    }
  });
}
