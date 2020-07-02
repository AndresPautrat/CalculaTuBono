import 'package:calcula_tu_bono/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:calcula_tu_bono/service/database.dart';
import 'package:provider/provider.dart';
import 'package:calcula_tu_bono/pages/list.dart';
import 'package:calcula_tu_bono/pages/bonoUnidad.dart';

class BondList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamProvider<List<bonoUnidad>>.value(
      value: DatabaseService().bonos,
      child: (Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Registrar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListOfBonds(),
      )),
    );
  }
}
