import 'package:calcula_tu_bono/pages/data_bond.dart';
import 'package:flutter/material.dart';

class BondDetail extends StatefulWidget {
  @override
  _BondDetailState createState() => _BondDetailState();
}

class _BondDetailState extends State<BondDetail> {
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
            Center(
              child: Text(
                "Tasas de Costo Efectivo",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(1),
                },
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Estructuración del Bono'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(''),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Frecuencia del cupón'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(DataBond.frecCupon.toStringAsFixed(0)),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Días capitalización'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(DataBond.diasCap.toStringAsFixed(0)),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Nº Períodos por Año'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(DataBond.nPeriodosAno.toStringAsFixed(0)),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Nº Total de Periodos'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(DataBond.nTotalPeriodos.toStringAsFixed(0)),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Tasa efectiva anual'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text((DataBond.tasaEfecticaAnual * 100)
                          .toStringAsFixed(5)),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Tasa efectiva del periodo'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text((DataBond.tasaEfectivaPeriodo * 100)
                          .toStringAsFixed(5)),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('COK del periodo'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child:
                          Text((DataBond.cOKPeriodo * 100).toStringAsFixed(5)),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Costes Iniciales Emisor'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text((DataBond.costeInicialEmisor * 100)
                          .toStringAsFixed(2)),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Costes Iniciales Bonista'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text((DataBond.costeInicialBonista * 100)
                          .toStringAsFixed(2)),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Precio Actual y Utilidad'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(''),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Precio Actual'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(DataBond.precioActual.toStringAsFixed(2)),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Utilidad / Pérdida'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(DataBond.utilidad.toStringAsFixed(2)),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Indicadores de Rentabilidad'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(''),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('TCEA Emisor'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child:
                          Text((DataBond.tCEAEmisor * 100).toStringAsFixed(5)),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('TCEA Emisor c/Escudo'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child:
                          Text((DataBond.tCEAEscudo * 100).toStringAsFixed(5)),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('TREA Bonista'),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child:
                          Text((DataBond.tREABonista * 100).toStringAsFixed(5)),
                    ),
                  ]),
                ],
              ),
            )
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
            Navigator.pop(context);
          },
          color: Colors.black,
          child: Text(
            "Regresar",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ));
  }
}
