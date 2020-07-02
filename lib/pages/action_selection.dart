import 'package:flutter/material.dart';

class ActionSelection extends StatefulWidget {
  @override
  _ActionSelectionState createState() => _ActionSelectionState();
}

class _ActionSelectionState extends State<ActionSelection> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(children: <Widget>[
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
            height: 50,
            child: null,
          ),
          Center(
            child: Text(
              "Menu",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 50,
            child: null,
          ),
          Container(
            height: 150,
            width: 150,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.black)),
              onPressed: () {
                Navigator.pushNamed(context, '/features');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Calcular Nuevo Bono",
                    textAlign: TextAlign.center,
                  ),
                  Icon(Icons.add),
                ],
              ),
              color: Colors.white,
            ),
          ),
          Container(
            height: 20,
            child: null,
          ),
          Container(
            height: 150,
            width: 150,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.black)),
              onPressed: () async {
                await Navigator.pushNamed(context, '/bond_list');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Ver Historial",
                    textAlign: TextAlign.center,
                  ),
                  Icon(Icons.history),
                ],
              ),
              color: Colors.white,
            ),
          )
        ]),
      ),
    ));
  }
}
