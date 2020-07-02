import 'package:calcula_tu_bono/pages/data_bond.dart';
import 'package:flutter/material.dart';
import 'package:calcula_tu_bono/pages/bonoUnidad.dart';

class BonoTile extends StatelessWidget {
  final bonoUnidad bono;
  BonoTile({this.bono});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: ListTile(
              title: Text(
                'TCEA del Emiso: ' + bono.tCEAEmisor.toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                'TREA de Bonista' + bono.tREABonista.toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              trailing: Icon(Icons.add),
              onTap: () {
                DataBond.metodo = bono.metodo;
                DataBond.capitalizacion = bono.capitalizacion;
                DataBond.frecuencia = bono.frecuencia;
                DataBond.tasa = bono.tasa;
                DataBond.diasAno = bono.diasAno;
                DataBond.moneda = bono.moneda;
                DataBond.plazo = bono.plazo;
                DataBond.checkInflacion = bono.checkInflacion;
                DataBond.nominal = bono.nominal;
                DataBond.comercial = bono.comercial;
                DataBond.nAnos = bono.nAnos;
                DataBond.tasaInteres = bono.tasaInteres;
                DataBond.tasaDesc = bono.tasaDesc;
                DataBond.imp = bono.imp;
                DataBond.porPrima = bono.porPrima;
                DataBond.porEstructurado = bono.porEstructurado;
                DataBond.porColocacion = bono.porColocacion;
                DataBond.porFlotacion = bono.porFlotacion;
                DataBond.porCavali = bono.porCavali;
                DataBond.nPlazos = bono.nPlazos;
                DataBond.process();
                Navigator.pushNamed(context, "/bond_detail");
              },
            )));
  }
}
