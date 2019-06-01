import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_consciousness/src/ui/screens/home.dart';
import 'package:flutter_consciousness/src/utils/object_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_consciousness/src/blocs/auth_bloc.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Country _selectedDialogCountry = CountryPickerUtils.getCountryByIsoCode('in');

  final _phoneNumberController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final _nameController = new TextEditingController();
  bool _isLoading = false;

  final authBloc = AuthBloc();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(
          "Login",
          style: Theme.of(context).textTheme.title,
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: new SafeArea(
          child: StreamBuilder(
              stream: authBloc.loadingListener,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return Center(
                    child: SingleChildScrollView(
                      child: new Container(
                        height: MediaQuery.of(context).size.height,
                        margin:
                            EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            StreamBuilder<String>(
                              stream: authBloc.email,
                              builder: (context, snapshot) => TextField(
                                    controller: _emailController,
                                    onChanged: (value) =>
                                        authBloc.emailChanged.add(value),
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      helperText: "Please enter your email id.",
                                      errorText: snapshot.error,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            StreamBuilder(
                                stream: authBloc.password,
                                builder: (context, snapshot) => TextField(
                                      controller: _passwordController,
                                      obscureText: _obscureText,
                                      onChanged: (value) =>
                                          authBloc.passwordChanged.add(value),
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        helperText: "Minimum 8 characters.",
                                        errorText: snapshot.error,
                                        suffixIcon: new IconButton(
                                            icon: Icon(_obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                            onPressed: () {
                                              setState(() =>
                                                  _obscureText = !_obscureText);
                                            }),
                                      ),
                                    )),
                            SizedBox(
                              height: 16.0,
                            ),
                            StreamBuilder<bool>(
                                stream: authBloc.submitCheckLogin,
                                builder: (context, snapshot) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 48.0),
                                    child: RaisedButton(
                                      padding: EdgeInsets.symmetric(vertical: 16.0),
                                      color: snapshot.hasData
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).disabledColor,
                                      onPressed: snapshot.hasData
                                          ? () {
//                                        authBloc.loadingSink.add(true);
                                        FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                                      email: _emailController.text,
                                                      password:
                                                          _passwordController.text)
                                                  .then((signedInUser) {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Home()),
                                                  (Route<dynamic> route) =>
                                              false);
                                              }).catchError((e) {
                                                print(e);
//                                                authBloc.loadingSink.add(false);
                                                if (e
                                                    .toString()
                                                    .contains("no user")) {
                                                  FirebaseAuth.instance
                                                      .createUserWithEmailAndPassword(
                                                          email:
                                                              _emailController.text,
                                                          password:
                                                              _passwordController
                                                                  .text)
                                                      .then((firebaseUser) {
//                                                        authBloc.loadingSink.add(false);
                                                    print("signup user");
                                                    print(firebaseUser.uid);
                                                    //Navigate to NextPage
                                                    ObjectFactory()
                                                        .prefs
                                                        .setIsLoggedIn(true);
                                                    Navigator.pushAndRemoveUntil(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Home()),
                                                        (Route<dynamic> route) =>
                                                            false);
                                                    FirebaseAuth.instance
                                                        .currentUser()
                                                        .then((firebaseUser2) {
                                                      print("signin user");
                                                      print(firebaseUser2.uid);
                                                    });
                                                  });
                                                } else if (e.toString().contains(
                                                    "password is invalid")) {
                                                  print(
                                                      "Password is invalid, Check password");
                                                }
                                              });
                                            }
                                          : null,
                                      child: !_isLoading?Text(
                                        "Continue",
                                        style: Theme.of(context)
                                            .textTheme
                                            .button
                                            .copyWith(
                                              color: snapshot.hasData
                                                  ? Colors.white
                                                  : Colors.black26,
                                            ),
                                      ):Center(child: CircularProgressIndicator(backgroundColor: Theme.of(context).scaffoldBackgroundColor),),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              })),
    );
  }

  _buildCountryPickerDropdown() => Row(
        children: <Widget>[
          CountryPickerDropdown(
            initialValue: 'in',
            itemBuilder: _buildDropdownItem,
            onValuePicked: (Country country) {
              print("${country.name}");
            },
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(labelText: "Phone"),
            ),
          )
        ],
      );

  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      );

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
//          SizedBox(width: 8.0),
//          Flexible(child: Text(country.name))
        ],
      );

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: CountryPickerDialog(
                titlePadding: EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                title: Text('Select your phone code'),
                onValuePicked: (Country country) {
                  setState(() => _selectedDialogCountry = country);
                },
                itemBuilder: _buildDialogItem)),
      );
}
