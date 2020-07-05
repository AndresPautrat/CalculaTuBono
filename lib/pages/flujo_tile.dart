import 'package:calcula_tu_bono/pages/data_bond.dart';
import 'package:flutter/material.dart';
import 'package:calcula_tu_bono/pages/bonoUnidad.dart';

class FlujoTile extends StatelessWidget {
  final String interes;
  final String cuota;
  final String amort;
  final String saldo;
  final String index;
  final String bonista;
  final String emisor;
  final String escudo;
  FlujoTile(
      {this.bonista,
      this.emisor,
      this.escudo,
      this.index,
      this.saldo,
      this.interes,
      this.cuota,
      this.amort});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: ListBody(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text(
                        index + ". ",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        saldo,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        interes,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        cuota,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        amort,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        bonista,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        emisor,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        escudo,
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
