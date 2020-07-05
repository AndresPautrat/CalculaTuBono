import 'package:calcula_tu_bono/pages/data_bond.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Features extends StatefulWidget {
  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  String metodo, capitalizacion, tasa, frecuencia, moneda, diasAno, plazo;
  bool inflacion = false;
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
                  "Seleccio de Caracteristicas",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 20,
                child: null,
              ),
              Text(
                "  Metodo",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              InputDecorator(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text("Seleccionar Opcion"),
                    value: metodo,
                    isDense: true,
                    onChanged: (newValue) {
                      setState(() {
                        metodo = newValue;
                      });
                    },
                    items: [
                      'Americano',
                      'Aleman',
                      'Frances',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                height: 20,
                child: null,
              ),
              Text(
                "  Capitalizacion",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              InputDecorator(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text("Seleccionar Opcion"),
                    value: capitalizacion,
                    isDense: true,
                    onChanged: (newValue) {
                      setState(() {
                        capitalizacion = newValue;
                      });
                    },
                    items: [
                      'Diaria',
                      'Quincenal',
                      'Mensual',
                      'Bimestral',
                      'Trimestral',
                      'Cuatrimestral',
                      'Semestral',
                      'Anual'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                height: 20,
                child: null,
              ),
              Text(
                "  Frecuencia de Pago",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              InputDecorator(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text("Seleccionar Opcion"),
                    value: frecuencia,
                    isDense: true,
                    onChanged: (newValue) {
                      setState(() {
                        frecuencia = newValue;
                      });
                    },
                    items: [
                      'Mensual',
                      'Bimestral',
                      'Trimestral',
                      'Cuatrimestral',
                      'Semestral',
                      'Anual'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                height: 20,
                child: null,
              ),
              Text(
                "  Tasa",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              InputDecorator(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text("Seleccionar Opcion"),
                    value: tasa,
                    isDense: true,
                    onChanged: (newValue) {
                      setState(() {
                        tasa = newValue;
                      });
                    },
                    items: [
                      'Tasa Nominal',
                      'Tasa Efectiva',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                height: 20,
                child: null,
              ),
              Text(
                "  Dias x Año",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              InputDecorator(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text("Seleccionar Opcion"),
                    value: diasAno,
                    isDense: true,
                    onChanged: (newValue) {
                      setState(() {
                        diasAno = newValue;
                      });
                    },
                    items: [
                      '360',
                      '365',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                height: 20,
                child: null,
              ),
              Text(
                "  Moneda",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              InputDecorator(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text("Seleccionar Opcion"),
                    value: moneda,
                    isDense: true,
                    onChanged: (newValue) {
                      setState(() {
                        moneda = newValue;
                      });
                    },
                    items: [
                      'Soles',
                      'Dolares Americanos',
                      'Euros',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                height: 20,
                child: null,
              ),
              Text(
                "  Plazo de gracia",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              InputDecorator(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text("Seleccionar Opcion"),
                    value: plazo,
                    isDense: true,
                    onChanged: (newValue) {
                      setState(() {
                        plazo = newValue;
                      });
                    },
                    items: [
                      'Parcial',
                      'Total',
                      'Ninguno',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Inflacion (3.0%)"),
                  Checkbox(
                      value: inflacion,
                      activeColor: Colors.green,
                      onChanged: (bool newValue) {
                        setState(() {
                          inflacion = newValue;
                        });
                        Text('Remember me');
                      }),
                ],
              )
            ]),
      ),
      bottomNavigationBar: Container(
        height: 110,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: RaisedButton(
          onPressed: () {
            if (metodo == null ||
                capitalizacion == null ||
                tasa == null ||
                frecuencia == null ||
                moneda == null ||
                diasAno == null ||
                plazo == null) {
              Fluttertoast.showToast(
                msg: "Ingrese todos los datos.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
              );
            } else {
              DataBond.moneda = moneda;
              DataBond.capitalizacion = capitalizacion;
              DataBond.frecuencia = frecuencia;
              DataBond.metodo = metodo;
              DataBond.tasa = tasa;
              DataBond.diasAno = int.parse(diasAno);
              DataBond.checkInflacion = inflacion;
              DataBond.plazo = plazo;

              Navigator.pushNamed(context, '/values');
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
