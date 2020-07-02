import 'package:calcula_tu_bono/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String pass;

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              height: 80,
              child: null,
            ),
            Center(
              child: Text(
                "Iniciar Sesion",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 20,
              child: null,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Corre Electronico",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextField(
                  onChanged: (text) {
                    email = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: 'Introdusca un correo',
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
              child: null,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Contraseña",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextField(
                  onChanged: (text) {
                    pass = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: 'Introdusc una contraseña',
                  ),
                ),
              ],
            ),
            Container(
              child: null,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 110,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: RaisedButton(
          onPressed: () async {
            if (pass == null || email == null) {
              Fluttertoast.showToast(
                msg: "Ingrese todos los datos.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
              );
            } else {
              dynamic result = await _auth.login(email, pass);
              print(result);
              if (result != null) {
                Fluttertoast.showToast(
                  msg: result,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                );
              } else {
                Navigator.pushNamed(context, '/action');
              }
            }
          },
          color: Colors.black,
          child: Text(
            "Siguiente",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ));
  }
}
