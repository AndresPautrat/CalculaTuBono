import 'package:calcula_tu_bono/pages/data_bond.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Values extends StatefulWidget {
  @override
  _ValuesState createState() => _ValuesState();
}

class _ValuesState extends State<Values> {
  double nominal,
      comercial,
      nAnos,
      tasaInteres,
      tasaDesc,
      imp,
      fEmision,
      porPrima,
      porEstructurado,
      porColocacion,
      porFlotacion,
      porCavali,
      nPlazo = 0;
  bool hayPlazo;
  @override
  Widget build(BuildContext context) {
    if (DataBond.plazo == "Ninguno") {
      hayPlazo = false;
    } else {
      hayPlazo = true;
    }
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
                "Introducir Valores",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              " Valor Nominal",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              onChanged: (text) {
                nominal = double.tryParse(text);
                if (nominal == null) {
                  nominal = int.tryParse(text).toDouble();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Introdusca un valor',
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              textInputAction: TextInputAction.done,
            ),
            Text(
              "Valor Comercial",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              onChanged: (text) {
                comercial = double.tryParse(text);
                if (comercial == null) {
                  comercial = int.tryParse(text).toDouble();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Introdusca un valor',
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              textInputAction: TextInputAction.done,
            ),
            Text(
              "Nro de Años",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              onChanged: (text) {
                nAnos = double.tryParse(text);
                if (nAnos == null) {
                  nAnos = int.tryParse(text).toDouble();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Introdusca un valor',
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              textInputAction: TextInputAction.done,
            ),
            Text(
              "Tasa de interes",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              onChanged: (text) {
                tasaInteres = double.tryParse(text);
                if (tasaInteres == null) {
                  tasaInteres = int.tryParse(text).toDouble();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Introdusca un valor',
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              textInputAction: TextInputAction.done,
            ),
            Text(
              "Tasa anual de descuento",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              onChanged: (text) {
                tasaDesc = double.tryParse(text);
                if (tasaDesc == null) {
                  tasaDesc = int.tryParse(text).toDouble();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Introdusca un valor',
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              textInputAction: TextInputAction.done,
            ),
            Text(
              "Imp. a la Renta",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              onChanged: (text) {
                imp = double.tryParse(text);
                if (imp == null) {
                  imp = int.tryParse(text).toDouble();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Introdusca un valor',
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              textInputAction: TextInputAction.done,
            ),
            Text(
              "Fecha de emision",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              onChanged: (text) {
                fEmision = double.tryParse(text);
                if (fEmision == null) {
                  fEmision = int.tryParse(text).toDouble();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Introdusca un valor',
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              textInputAction: TextInputAction.done,
            ),
            Text(
              "% de Prima",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              onChanged: (text) {
                porPrima = double.tryParse(text);
                if (porPrima == null) {
                  porPrima = int.tryParse(text).toDouble();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Introdusca un valor',
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              textInputAction: TextInputAction.done,
            ),
            Text(
              "% Estructuracion",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              onChanged: (text) {
                porEstructurado = double.tryParse(text);
                if (porEstructurado == null) {
                  porEstructurado = int.tryParse(text).toDouble();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Introdusca un valor',
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              textInputAction: TextInputAction.done,
            ),
            Text(
              "% Colocacion",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              onChanged: (text) {
                porColocacion = double.tryParse(text);
                if (porColocacion == null) {
                  porColocacion = int.tryParse(text).toDouble();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Introdusca un valor',
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              textInputAction: TextInputAction.done,
            ),
            Text(
              "% Flotacion",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              onChanged: (text) {
                porFlotacion = double.tryParse(text);
                if (porFlotacion == null) {
                  porFlotacion = int.tryParse(text).toDouble();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Introdusca un valor',
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              textInputAction: TextInputAction.done,
            ),
            Text(
              "% CAVALI",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              onChanged: (text) {
                porCavali = double.tryParse(text);
                if (porCavali == null) {
                  porCavali = int.tryParse(text).toDouble();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Introdusca un valor',
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              textInputAction: TextInputAction.done,
            ),
            Text(
              "Numero de Plazos",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              enabled: hayPlazo,
              onChanged: (text) {
                nPlazo = double.tryParse(text);
                if (nPlazo == null) {
                  nPlazo = int.tryParse(text).toDouble();
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Introdusca un valor',
              ),
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 110,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: RaisedButton(
          onPressed: () {
            if (nominal == null ||
                comercial == null ||
                nAnos == null ||
                tasaInteres == null ||
                tasaDesc == null ||
                imp == null ||
                fEmision == null ||
                porPrima == null ||
                porEstructurado == null ||
                porColocacion == null ||
                porFlotacion == null ||
                porCavali == null) {
              Fluttertoast.showToast(
                msg: "Ingresa todos los datos correctamente",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
              );
            } else {
              if (hayPlazo) {
                if (nPlazo == 0) {
                  Fluttertoast.showToast(
                    msg: "Ingresa todos los datos correctamente",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                  );
                } else {
                  DataBond.comercial = comercial;
                  DataBond.fEmision = fEmision;
                  DataBond.imp = imp / 100;
                  DataBond.nAnos = nAnos;
                  DataBond.nominal = nominal;
                  DataBond.porCavali = porCavali / 100;
                  DataBond.porColocacion = porColocacion / 100;
                  DataBond.porEstructurado = porEstructurado / 100;
                  DataBond.porFlotacion = porFlotacion / 100;
                  DataBond.porPrima = porPrima / 100;
                  DataBond.tasaDesc = tasaDesc / 100;
                  DataBond.tasaInteres = tasaInteres / 100;
                  DataBond.nPlazos = nPlazo;
                  DataBond.process();

                  Navigator.pushNamed(context, '/bond');
                }
              } else {
                DataBond.comercial = comercial;
                DataBond.fEmision = fEmision;
                DataBond.imp = imp / 100;
                DataBond.nAnos = nAnos;
                DataBond.nominal = nominal;
                DataBond.porCavali = porCavali / 100;
                DataBond.porColocacion = porColocacion / 100;
                DataBond.porEstructurado = porEstructurado / 100;
                DataBond.porFlotacion = porFlotacion / 100;
                DataBond.porPrima = porPrima / 100;
                DataBond.tasaDesc = tasaDesc / 100;
                DataBond.tasaInteres = tasaInteres / 100;
                DataBond.nPlazos = nPlazo;
                DataBond.process();

                Navigator.pushNamed(context, '/bond');
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
