import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class Global {
  static const Color colorBlanco = const Color(0xffffffff);
  static const Color colorAzul = const Color(0xff44A54FE);
  static const Color colorEmpresa = const Color(0xfff6498d1);
  static const Color colorNegro = const Color(0xff000000);

  static void mensaje(BuildContext context, String mensaje, String titulo, {Color backgroundColorCustom = Colors.redAccent}){
    
    Flushbar(
      title: titulo,
      message: mensaje,
      duration: const Duration(seconds: 3),
      isDismissible: false,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor: backgroundColorCustom
    ).show(context);
  }
}

