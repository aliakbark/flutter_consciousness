import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
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

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return new Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        StreamBuilder<String>(
                          stream: authBloc.name,
                          builder: (context, snapshot) => TextField(
                                controller: _nameController,
                                onChanged: (value) =>
                                    authBloc.nameChanged.add(value),
                                decoration: InputDecoration(
                                  labelText: "Your name",
                                  helperText: "Please enter your name.",
                                  errorText: snapshot.error,
                                ),
                                keyboardType: TextInputType.text,
                              ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new InkWell(
                              child: _buildDialogItem(_selectedDialogCountry),
                              onTap: _openCountryPickerDialog,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            new Expanded(
                              child: StreamBuilder<String>(
                                  stream: authBloc.mobile,
                                  builder: (context, snapshot) => TextField(
                                        controller: _phoneNumberController,
                                        onChanged: (value) =>
                                            authBloc.mobileChanged.add(value),
                                        decoration: InputDecoration(
                                            labelText: "Phone number",
                                            errorText: snapshot.error),
                                        keyboardType: TextInputType.phone,
                                      )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
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
                        StreamBuilder<String>(
                            stream: authBloc.mobile,
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
                                          ObjectFactory()
                                              .prefs
                                              .setIsLoggedIn(true);
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Home()),
                                              (Route<dynamic> route) => false);
                                        }
                                      : null,
                                  child: Text(
                                    "Continue",
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        .copyWith(
                                          color: snapshot.hasData
                                              ? Colors.white
                                              : Colors.black26,
                                        ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  );
                }
              })),
      bottomNavigationBar: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new InkWell(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 4.0),
              child: RichText(
                  text: TextSpan(
                      text: "Terms and conditions",
//                      style: Theme.of(context).textTheme.body1,
                      style: Theme.of(context).textTheme.body2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                      children: <TextSpan>[
                    TextSpan(
                      text: "",
                      style: Theme.of(context).textTheme.subhead.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    )
                  ])),
            ),
            onTap: () {},
          ),
        ],
      ),
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
