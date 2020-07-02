import 'package:calcula_tu_bono/pages/data_bond.dart';
import 'package:calcula_tu_bono/service/auth.dart';
import 'package:calcula_tu_bono/service/database.dart';
import 'package:flutter/material.dart';

class Bond extends StatefulWidget {
  @override
  _BondState createState() => _BondState();
}

class _BondState extends State<Bond> {
  final DatabaseService _db = DatabaseService();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
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
              height: 20,
              child: null,
            ),
            Center(
              child: Text(
                "Tasas de Costo Efectivo",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 100,
              child: null,
            ),
            Text(
              "TREA del Bonista",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Text(
                      (DataBond.tREABonista * 100).toStringAsFixed(5),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "\$",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 20,
              child: null,
            ),
            Text(
              "TCEA del Emisor",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Text(
                      (DataBond.tCEAEmisor * 100).toStringAsFixed(5),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "\$",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.black)),
                onPressed: () {
                  Navigator.pushNamed(context, '/bond_detail');
                },
                color: Colors.black,
                child: Text(
                  "Detalle",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 110,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.black)),
          onPressed: () {
            _db.updateUserData(
              DataBond.tIRBonista,
              DataBond.tCEAEmisor,
              DataBond.metodo,
              DataBond.capitalizacion,
              DataBond.frecuencia,
              DataBond.tasa,
              DataBond.diasAno,
              DataBond.moneda,
              DataBond.plazo,
              DataBond.checkInflacion,
              DataBond.nominal,
              DataBond.comercial,
              DataBond.nAnos,
              DataBond.tasaInteres,
              DataBond.tasaDesc,
              DataBond.imp,
              DataBond.porPrima,
              DataBond.porEstructurado,
              DataBond.porColocacion,
              DataBond.porFlotacion,
              DataBond.porCavali,
              DataBond.nPlazos,
            );
          },
          child: Text(
            "Guardar",
          ),
          color: Colors.white,
        ),
      ),
    ));
  }
}
