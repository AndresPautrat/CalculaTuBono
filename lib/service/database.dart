import 'dart:math';

import 'package:calcula_tu_bono/pages/data_bond.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:calcula_tu_bono/pages/bonoUnidad.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference bonosCollection =
      Firestore.instance.collection('bonds');

  Future updateUserData(
    double tREABonista,
    double tCEAEmisor,
    String metodo,
    String capitalizacion,
    String frecuencia,
    String tasa,
    int diasAno,
    String moneda,
    String plazo,
    bool checkInflacion,
    double nominal,
    double comercial,
    double nAnos,
    double tasaInteres,
    double tasaDesc,
    double imp,
    double porPrima,
    double porEstructurado,
    double porColocacion,
    double porFlotacion,
    double porCavali,
    double nPlazos,
  ) async {
    var rng = new Random();
    return await bonosCollection
        .document(DataBond.user + rng.nextInt(100000).toString())
        .setData({
      'user': DataBond.user,
      'tREABonista': tREABonista,
      'tCEAEmisor': tCEAEmisor,
      'metodo': metodo,
      'capitalizacion': capitalizacion,
      'frecuencia': frecuencia,
      'tasa': tasa,
      'diasAno': diasAno,
      'moneda': moneda,
      'plazo': plazo,
      'checkInflacion': checkInflacion,
      'nominal': nominal,
      'comercial': comercial,
      'nAnos': nAnos,
      'tasaInteres': tasaInteres,
      'tasaDesc': tasaDesc,
      'imp': imp,
      'porPrima': porPrima,
      'porEstructurado': porEstructurado,
      'porColocacion': porColocacion,
      'porFlotacion': porFlotacion,
      'porCavali': porCavali,
      'nPlazos': nPlazos,
    });
  }

  Stream<List<bonoUnidad>> get bonos {
    return bonosCollection.snapshots().map(_bonoFromSnapshot);
  }

  List<bonoUnidad> _bonoFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return bonoUnidad(
        user: doc.data['user'],
        tCEAEmisor: doc.data["tCEAEmisor"],
        tREABonista: doc.data["tREABonista"],
        diasAno: doc.data['diasAno'],
        metodo: doc.data['metodo'],
        capitalizacion: doc.data['capitalizacion'],
        tasa: doc.data['tasa'],
        frecuencia: doc.data['frecuencia'],
        moneda: doc.data['moneda'],
        plazo: doc.data['plazo'],
        checkInflacion: doc.data['checkInflacion'],
        nominal: doc.data['nominal'],
        comercial: doc.data['comercial'],
        nAnos: doc.data['nAnos'],
        tasaInteres: doc.data['tasaInteres'],
        tasaDesc: doc.data['tasaDesc'],
        imp: doc.data['imp'],
        porPrima: doc.data['porPrima'],
        porEstructurado: doc.data['porEstructurado'],
        porColocacion: doc.data['porColocacion'],
        porFlotacion: doc.data['porFlotacion'],
        porCavali: doc.data['porCavali'],
        nPlazos: doc.data['nPlazos'],
      );
    }).toList();
  }
}
