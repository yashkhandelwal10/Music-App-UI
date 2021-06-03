import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vikrant_app/api/Google_SignIn_api.dart';
import 'package:vikrant_app/api/api_service.dart';
import 'package:vikrant_app/model/login_model.dart';
import 'package:vikrant_app/progreeHUD.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  late LoginRequestModel requestModel;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel(email: '', password: "");
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget uiSetup(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                  margin:
                      EdgeInsets.symmetric(vertical: 85.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => requestModel.email = input!,
                          validator: (input) => !input!.contains("@")
                              ? "Email Id should be valid"
                              : null,
                          decoration: new InputDecoration(
                            hintText: "Email Address",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) => requestModel.password = input!,
                          validator: (input) => input!.length < 3
                              ? "Password shuold be more than 3 letters"
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                              hintText: "Password",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).accentColor,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.4),
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              )),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextButton(
                          //  style: padding: EdgeInsets.symmetric(
                          //     vertical: 12,
                          //     horizontal: 80,
                          //   ),
                          onPressed: () {
                            if (validateAndSave()) {
                              setState(() {
                                isApiCallProcess = true;
                              });
                              APIService apiService = new APIService();
                              apiService.login(requestModel).then((value) {
                                setState(() {
                                  isApiCallProcess = false;
                                });

                                if (value.token.isNotEmpty) {
                                  final snackbar = SnackBar(
                                    content: Text("Login Successful"),
                                  );
                                  // scaffoldKey.currentState!
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                } else {
                                  final snackbar = SnackBar(
                                    content: Text(value.error),
                                  );
                                  // scaffoldKey.currentState!
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackbar);
                                }
                              });
                              print(requestModel.toJson());
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.green[800],
                            onSurface: Colors.grey[200],
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 80,
                            ),
                            shape: StadiumBorder(),
                          ),
                          // color: Theme.of(context).accentColor,
                        ),
                        // ElevatedButton.icon(
                        //   style: ElevatedButton.styleFrom(
                        //     primary: Colors.white,
                        //     onPrimary: Colors.black,
                        //     minimumSize: Size(double.infinity, 50),
                        //   ),
                        //   icon: Falcon(
                        //     FontAwesomeIcons.google,
                        //     color: Colors.red,
                        //   ),
                        //   label: Text("Sign Up with Google"),
                        //   onPressed: signIn,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future signIn() async {
    await GoogleSignInApi.login();
  }
}
