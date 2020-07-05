import 'package:calcula_tu_bono/pages/data_bond.dart';
import 'package:calcula_tu_bono/pages/flujo_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlujoList extends StatefulWidget {
  @override
  _FlujoListState createState() => _FlujoListState();
}

class _FlujoListState extends State<FlujoList> {
  @override
  Widget build(BuildContext context) {
    List<String> bonos = [];
    List<String> interes = [];
    List<String> cuota = [];
    List<String> amort = [];
    List<String> indexs = [];
    int counter = 0;
    indexs.add("-");
    bonos.add("Bonos");
    interes.add("Interes");
    cuota.add("Cuota");
    amort.add("Amort.");
    bonos.add("-");
    interes.add("-");
    cuota.add("-");
    amort.add("-");
    DataBond.bono.forEach((bono) {
      bonos.add(bono.toStringAsFixed(2));
    });
    DataBond.cupon.forEach((cupon) {
      interes.add(cupon.toStringAsFixed(2));
    });
    DataBond.cuota.forEach((_cuota) {
      cuota.add(_cuota.toStringAsFixed(2));
    });
    DataBond.amort.forEach((_amort) {
      amort.add(_amort.toStringAsFixed(2));
    });
    List<String> bonista = [];
    List<String> emisor = [];
    List<String> escudo = [];
    bonista.add("FBonista");
    emisor.add("FEmisor");
    escudo.add("FEscudo");
    DataBond.flujoBonista.forEach((flujoBonista) {
      indexs.add(counter.toString());
      counter++;
      bonista.add(flujoBonista.toStringAsFixed(2));
    });
    DataBond.flujoEmisor.forEach((flujoEmisor) {
      emisor.add(flujoEmisor.toStringAsFixed(2));
    });
    DataBond.flujoEscudo.forEach((flujoEscudo) {
      escudo.add(flujoEscudo.toStringAsFixed(2));
    });
    if (DataBond.flujoBonista != null) {
      return ListView.builder(
        itemCount: DataBond.flujoBonista.length + 1,
        itemBuilder: (context, index) {
          return FlujoTile(
            bonista: (bonista[index]),
            emisor: (emisor[index]),
            escudo: (escudo[index]),
            index: indexs[index],
            saldo: (bonos[index]),
            interes: (interes[index]),
            cuota: (cuota[index]),
            amort: (amort[index]),
          );
        },
      );
    } else {
      return (Container());
    }
  }
}
