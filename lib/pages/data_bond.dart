import 'dart:math';
import 'package:finance/finance.dart';

class DataBond {
  static String user;
  static double nominal,
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
      porCavali;
  static String metodo, capitalizacion, tasa, frecuencia, moneda, plazo;
  static int diasAno;

  static double frecCupon,
      diasCap,
      nPeriodosAno,
      nTotalPeriodos,
      tasaEfecticaAnual,
      tasaEfectivaPeriodo,
      cOKPeriodo,
      costeInicialEmisor,
      costeInicialBonista,
      inflacion,
      nPlazos;

  static double precioActual, utilidad;

  static double tCEAEmisor, tREABonista, tCEAEmisorEscudo;

  static var bono,
      bonoI,
      cupon,
      cuota,
      amort,
      flujoEmisor,
      flujoBonista,
      tIRBonista,
      tIREmisor,
      escudo,
      flujoEscudo,
      tIREscudo,
      tCEAEscudo;

  static double IRR;

  static bool checkInflacion;

  static void process() {
    switch (frecuencia) {
      case "Mensual":
        frecCupon = 30;
        break;
      case "Bimestral":
        frecCupon = 60;
        break;
      case "Trimestral":
        frecCupon = 90;
        break;
      case "Cuatrimestral":
        frecCupon = 120;
        break;
      case "Semestral":
        frecCupon = 180;
        break;
      case "Anual":
        frecCupon = 360;
        break;
    }
    switch (capitalizacion) {
      case "Diaria":
        diasCap = 1;
        break;
      case "Quincenal":
        diasCap = 15;
        break;
      case "Mensual":
        diasCap = 30;
        break;
      case "Bimestral":
        diasCap = 60;
        break;
      case "Trimestral":
        diasCap = 90;
        break;
      case "Cuatrimestral":
        diasCap = 120;
        break;
      case "Semestral":
        diasCap = 180;
        break;
      case "Anual":
        diasCap = 360;
        break;
    }

    nPeriodosAno = diasAno / frecCupon;

    nTotalPeriodos = nAnos * nPeriodosAno;

    if (tasa == "Tasa Efectiva") {
      tasaEfecticaAnual = tasaInteres;
    } else if (tasa == "Tasa Nominal") {
      tasaEfecticaAnual =
          pow(1 + tasaInteres / (diasAno / diasCap), (diasAno / diasCap)) - 1;
    }

    tasaEfectivaPeriodo = pow(1 + tasaEfecticaAnual, frecCupon / diasAno) - 1;

    cOKPeriodo = pow(1 + tasaDesc, frecCupon / diasAno) - 1;

    costeInicialEmisor =
        (porEstructurado + porColocacion + porFlotacion + porCavali) *
            comercial;

    costeInicialBonista = (porFlotacion + porCavali) * comercial;

    int aux_Nperiodos = nTotalPeriodos.toInt();
    bono = new List(aux_Nperiodos);
    bonoI = new List(aux_Nperiodos);
    cupon = new List(aux_Nperiodos);
    cuota = new List(aux_Nperiodos);
    amort = new List(aux_Nperiodos);
    flujoEmisor = new List<num>(aux_Nperiodos + 1);
    flujoBonista = new List<num>(aux_Nperiodos + 1);
    flujoEscudo = new List<num>(aux_Nperiodos + 1);

    if (checkInflacion) {
      inflacion = pow(1.03, frecCupon / diasAno) - 1;
    } else {
      inflacion = 0.0;
    }

    switch (metodo) {
      case "Frances":
        periodoFrances();
        break;
      case "Americano":
        periodoAmericano();
        break;
      case "Aleman":
        periodoAleman();
        break;
    }

    utilidad = Finance.npv(rate: cOKPeriodo, values: flujoBonista);

    precioActual = utilidad - flujoBonista[0];

    tIRBonista = Finance.irr(values: flujoBonista);

    tIREmisor = Finance.irr(values: flujoEmisor);

    tCEAEmisor = pow(tIREmisor + 1, diasAno / frecCupon) - 1;

    tREABonista = pow(tIRBonista + 1, diasAno / frecCupon) - 1;

    tIREscudo = Finance.irr(values: flujoEscudo);

    tCEAEscudo = pow(tIREscudo + 1, diasAno / frecCupon) - 1;
  }

  static void periodoFrances() {
    bono[0] = nominal;
    bonoI[0] = bono[0] * (1 + inflacion);
    cupon[0] = -tasaEfectivaPeriodo * bonoI[0];
    cuota[0] = Finance.pmt(
        rate: tasaEfectivaPeriodo,
        nper: (nTotalPeriodos - 1 + 1),
        pv: bonoI[0]);
    amort[0] = cupon[0] + cuota[0];
    if (1 <= nPlazos) {
      if (plazo == "Total") {
        cuota[0] = 0;
        amort[0] = 0;
      } else if (plazo == "Parcial") {
        cuota[0] = cupon[0];
        amort[0] = 0;
      }
    }
    flujoEmisor[0] = comercial - costeInicialEmisor;
    flujoBonista[0] = -comercial - costeInicialBonista;
    flujoEscudo[0] = flujoEmisor[0];

    flujoEmisor[1] = cuota[0];
    flujoBonista[1] = flujoEmisor[1] * (-1);
    flujoEscudo[1] = (-cupon[0]) * imp + flujoEmisor[1];
    for (int i = 1; i < nTotalPeriodos.toInt(); i++) {
      bono[i] = bonoI[i - 1] + amort[i - 1];
      bonoI[i] = bono[i] * (1 + inflacion);
      cupon[i] = -tasaEfectivaPeriodo * bonoI[i];
      cuota[i] = Finance.pmt(
          rate: tasaEfectivaPeriodo, nper: (nTotalPeriodos - i), pv: bonoI[i]);
      amort[i] = cuota[i] - cupon[i];
      if (i + 1 <= nPlazos) {
        if (plazo == "Total") {
          cuota[i] = 0;
          amort[i] = 0;
        } else if (plazo == "Parcial") {
          cuota[i] = cupon[i];
          amort[i] = 0;
        }
      }
      flujoEmisor[i + 1] = cuota[i];
      if (i + 1 == nTotalPeriodos.toInt()) {
        flujoEmisor[i + 1] -= porPrima * nominal;
      }
      flujoBonista[i + 1] = flujoEmisor[i + 1] * (-1);
      flujoEscudo[i + 1] = (-cupon[i]) * imp + flujoEmisor[i + 1];
    }
  }

  static void periodoAmericano() {
    bono[0] = nominal;
    bonoI[0] = bono[0] * (1 + inflacion);
    cupon[0] = -tasaEfectivaPeriodo * bonoI[0];
    amort[0] = 0;
    cuota[0] = cupon[0] + amort[0];

    if (1 <= nPlazos) {
      if (plazo == "Total") {
        cuota[0] = 0;
        amort[0] = 0;
      } else if (plazo == "Parcial") {
        cuota[0] = cupon[0];
        amort[0] = 0;
      }
    }
    flujoEmisor[0] = comercial - costeInicialEmisor;
    flujoBonista[0] = -comercial - costeInicialBonista;
    flujoEscudo[0] = flujoEmisor[0];

    flujoEmisor[1] = cuota[0];
    flujoBonista[1] = flujoEmisor[1] * (-1);
    flujoEscudo[1] = (-cupon[0]) * imp + flujoEmisor[1];
    for (int i = 1; i < nTotalPeriodos.toInt(); i++) {
      bono[i] = bonoI[i - 1] + amort[i - 1];
      bonoI[i] = bono[i] * (1 + inflacion);
      cupon[i] = -tasaEfectivaPeriodo * bonoI[i];
      amort[i] = 0;
      if (i + 1 == nTotalPeriodos.toInt()) {
        amort[i] = -bonoI[i];
      }
      cuota[i] = cupon[i] + amort[i];

      if (i + 1 <= nPlazos) {
        if (plazo == "Total") {
          cuota[i] = 0;
          amort[i] = 0;
        } else if (plazo == "Parcial") {
          cuota[i] = cupon[i];
          amort[i] = 0;
        }
      }
      flujoEmisor[i + 1] = cuota[i];
      if (i + 1 == nTotalPeriodos.toInt()) {
        flujoEmisor[i + 1] -= porPrima * nominal;
      }
      flujoBonista[i + 1] = flujoEmisor[i + 1] * (-1);
      flujoEscudo[i + 1] = (-cupon[i]) * imp + flujoEmisor[i + 1];
    }
  }

  static void periodoAleman() {
    bono[0] = nominal;
    bonoI[0] = bono[0] * (1 + inflacion);
    cupon[0] = -tasaEfectivaPeriodo * bonoI[0];
    amort[0] = -nominal / nTotalPeriodos;
    cuota[0] = amort[0] + cupon[0];
    if (1 <= nPlazos) {
      if (plazo == "Total") {
        cuota[0] = 0;
        amort[0] = 0;
      } else if (plazo == "Parcial") {
        cuota[0] = cupon[0];
        amort[0] = 0;
      }
    }
    flujoEmisor[0] = comercial - costeInicialEmisor;
    flujoBonista[0] = -comercial - costeInicialBonista;
    flujoEscudo[0] = flujoEmisor[0];

    flujoEmisor[1] = cuota[0];
    flujoBonista[1] = flujoEmisor[1] * (-1);
    flujoEscudo[1] = (-cupon[0]) * imp + flujoEmisor[1];
    for (int i = 1; i < nTotalPeriodos.toInt(); i++) {
      bono[i] = bonoI[i - 1] + amort[i - 1];
      bonoI[i] = bono[i] * (1 + inflacion);
      cupon[i] = -tasaEfectivaPeriodo * bonoI[i];
      amort[i] = -nominal / nTotalPeriodos;
      cuota[i] = amort[i] + cupon[i];
      if (i + 1 <= nPlazos) {
        if (plazo == "Total") {
          cuota[i] = 0;
          amort[i] = 0;
        } else if (plazo == "Parcial") {
          cuota[i] = cupon[i];
          amort[i] = 0;
        }
      }
      flujoEmisor[i + 1] = cuota[i];
      if (i + 1 == nTotalPeriodos.toInt()) {
        flujoEmisor[i + 1] -= porPrima * nominal;
      }
      flujoBonista[i + 1] = flujoEmisor[i + 1] * (-1);
      flujoEscudo[i + 1] = (-cupon[i]) * imp + flujoEmisor[i + 1];
    }
  }
}
