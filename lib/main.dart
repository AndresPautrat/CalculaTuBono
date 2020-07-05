import 'package:calcula_tu_bono/pages/flujos_page.dart';
import 'package:flutter/material.dart';

import 'package:calcula_tu_bono/pages/bond_detail.dart';
import 'package:calcula_tu_bono/pages/bond_list.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/register.dart';
import 'pages/login.dart';
import 'pages/feaures.dart';
import 'pages/values.dart';
import 'pages/bond.dart';
import 'pages/action_selection.dart';
import 'pages/bond_list.dart';
import 'pages/bond_detail.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/home': (context) => Home(),
        '/register': (context) => Register(),
        '/login': (context) => Login(),
        '/features': (context) => Features(),
        '/values': (context) => Values(),
        '/bond': (context) => Bond(),
        '/action': (context) => ActionSelection(),
        '/bond_list': (context) => BondList(),
        '/bond_detail': (context) => BondDetail(),
        '/flujo': (contexto) => Flujo(),
      },
    ));
