import 'package:delivery/controllers/login.controller.dart';
import 'package:delivery/theme/light.theme.dart';
import 'package:delivery/view/appAndroid/home.andoid.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  final controller = LoginController();
  var busy = false;

  handleSignIn() {
    setState(() {
      busy = true;
    });
    controller.login().then((data) {
      onSuccess();
    }).catchError((err) {
      onError();
    }).whenComplete(() {
      onComplete();
    });
  }

  onSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }

  onError() {
    var snackbar = new SnackBar(content: new Text("Falha no login"));
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  onComplete() {
    setState(() {
      busy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: backgroundColor,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     stops: [0.3, 9],
          //     colors: [Colors.blue[900], primaryColor],
          //   ),
          // ),
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: LayoutBuilder(
                    builder: (_, constraints) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //--------------------------------------------------------container do logo
                          Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/images/logo.jpg",
                                  width: constraints.maxWidth * 0.6,
                                  height: constraints.maxHeight * 0.3,
                                ),
                              ],
                            ),
                          ),
                          //----------------------------------------------------------------- container dos form
                          Container(
                            // color: Colors.yellow,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight / 3,
                            child: Form(
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      textAlign: TextAlign.center,
                                      textInputAction: TextInputAction.go,
                                      // maxLength: 19,
                                      decoration: InputDecoration(
                                        hintText: "Digite seu email",
                                        // border: OutlineInputBorder(
                                        //   borderRadius: BorderRadius.circular(10),
                                        // ),
                                        hintStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: primaryColor),
                                      ),
                                      // controller:
                                      //     variableBloc.controllerCardNumber,
                                      validator: validarEmail,
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * 0.05,
                                          fontWeight: FontWeight.w600,
                                          color: backgroundColor),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      obscureText: true,
                                      textInputAction: TextInputAction.go,
                                      decoration: InputDecoration(
                                        hintText: "Digite a senha",
                                        hintStyle: TextStyle(
                                            fontSize: 20.0,
                                            color: primaryColor),
                                      ),
                                      // controller: variableBloc
                                      //     .controllerCardPassword,
                                      validator: validarPassword,
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * 0.05,
                                          fontWeight: FontWeight.w600,
                                          color: backgroundColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //------------------------------------------------------- container do button
                          Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight / 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SignInButtonBuilder(
                                  text: 'Entrar',
                                  icon: Icons.arrow_forward_ios,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeView(),
                                      ),
                                    );
                                  },
                                  backgroundColor: primaryColor,
                                  width: 220.0,
                                ),
                                SignInButtonBuilder(
                                  text: 'Cadastrar',
                                  icon: Icons.check,
                                  onPressed: () {},
                                  backgroundColor: Colors.blueGrey[200],
                                  width: 220.0,
                                ),
                                SizedBox(height: 10),
                                Text("- or -"),
                                SizedBox(height: 10),
                                SignInButton(
                                  Buttons.Google,
                                  onPressed: () {
                                    handleSignIn();
                                  },
                                ),
                                FlatButton(
                                  onPressed: null,
                                  child: Column(
                                    children: <Widget>[
                                      Text("Precisa de ajuda? Clica aqui!",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String validarEmail(String value) {
    String pattern =
        r'^( ([^<>()[\]\\.,;:\s@\"]+ ( \.[^<>()[\]\\.,;:\s@\"]+)*) | (\".+\") ) @ ( (\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\]) | ( ([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}) )$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Por favor, informe o Email";
    } else if (!regExp.hasMatch(value)) {
      return "Desculpas, mais deu errado! O Email é inválido";
    } else {
      return null;
    }
  }

  String validarPassword(String value) {
    String patttern = r'(^[0-9+\-]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Por favor, informe a senha";
    } else if (value.length <= 4) {
      return "A senha deve ter mais de 4 números!";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado!'";
    }
    return null;
  }
}
