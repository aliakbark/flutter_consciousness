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
        if(isInt(mobile)) {
          if (mobile.length ==10) {
            sink.add(mobile);
          } else {
            sink.addError("Invalid mobile number");
          }
        }
  });

  var emailMobileValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (emailMobile, sink) {
    if (emailMobile.length > 9) {
      sink.add(emailMobile);
    } else {
      sink.addError("Invalid input");
    }
  });

  var fnameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (fname, sink) {
    if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(fname) &&
        fname.length >=1) {
      sink.add(fname);
    } else {
      sink.addError("Minimum 2 characters, no special characters allowed");
    }
  });

  var lnameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (lname, sink) {
    if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(lname) &&
        lname.length >=1) {
      sink.add(lname);
    } else {
      sink.addError("Minimum 2 characters, no special characters allowed");
    }
  });

  var birthDateValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (bdate, sink) {
    try {
      DateTime.parse(bdate);
      sink.add(bdate);
    } catch (e) {
      sink.addError("Must have followed the format \"yyyy-mm-dd\"");
    }
  });
  var bioValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (bio, sink) {
    if (bio.isNotEmpty) {
      sink.add(bio);
    } else {
      sink.addError("Enter a short bio");
    }
  });
  var genderValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (gender, sink) {
    if (gender.isNotEmpty) {
      sink.add(gender);
    } else {
      sink.addError("Select your gender");
    }
  });

  var professionValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (profession, sink) {
    if (profession.isNotEmpty) {
      sink.add(profession);
    } else {
      sink.addError("Select your profession");
    }
  });

  var locationValidator =
  StreamTransformer<String, String>.fromHandlers(handleData: (location, sink) {
    if (location.split(",").length!=3) {
      sink.add(location);
    } else {
      sink.addError("Select your profession");
    }
  });
}
