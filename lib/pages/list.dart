import 'package:calcula_tu_bono/pages/data_bond.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:calcula_tu_bono/pages/bonoUnidad.dart';
import 'package:calcula_tu_bono/pages/bonoTile.dart';

class ListOfBonds extends StatefulWidget {
  @override
  _ListOfBondsState createState() => _ListOfBondsState();
}

class _ListOfBondsState extends State<ListOfBonds> {
  @override
  Widget build(BuildContext context) {
    final bonos = Provider.of<List<bonoUnidad>>(context);
    List<bonoUnidad> auxBonos = [];
    bonos.forEach((bono) {
      if (bono.user == DataBond.user) {
        auxBonos.add(bono);
      }
    });

    if (bonos != null) {
      return ListView.builder(
        itemCount: auxBonos.length,
        itemBuilder: (context, index) {
          return BonoTile(bono: auxBonos[index]);
        },
      );
    } else {
      return (Container());
    }
  }
}
