import 'package:flutter/material.dart';
import 'package:flutter_formulario/views/home.dart';
import 'package:flutter_formulario/widgets/button_widget.dart';
import 'package:flutter_formulario/widgets/textField_widget.dart';
import 'package:flutter_formulario/utils/global.dart';
import 'package:flutter_formulario/services/ProfileService.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final TextEditingController _controllerUSER = TextEditingController();
  final TextEditingController _controllerPASSWORD = TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Builder(builder: (context) {
            return Center(
                child: SingleChildScrollView(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Image.network(
                      'https://www.instagram.com/static/images/web/logged_out_wordmark-2x.png/d2529dbef8ed.png',
                      width: 200),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                  child: TextFieldWidget(
                    textColor: Colors.black,
                    isPrefixIcon: true,
                    isFilled: true,
                    borderColor: const Color.fromARGB(255, 176, 176, 176),
                    backgrounColor: const Color(0xfffafafa),
                    color: const Color.fromARGB(255, 176, 176, 176),
                    prefixIconData: Icons.person,
                    isMyController: true,
                    controller: _controllerUSER,
                    hintText: 'Ingresa tu Username',
                    onChanged: (String value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                  child: TextFieldWidget(
                      textColor: Colors.black,
                      isPrefixIcon: true,
                      prefixIconData: Icons.lock,
                      isSuffixIcon: true,
                      isFilled: true,
                      borderColor: const Color.fromARGB(255, 176, 176, 176),
                      backgrounColor: const Color(0xfffafafa),
                      color: const Color.fromARGB(255, 176, 176, 176),
                      suffixIconData: Icons.remove_red_eye_outlined,
                      isMyController: true,
                      controller: _controllerPASSWORD,
                      onSuffixIconTap: () {
                        print('click');
                      },
                      hintText: 'Ingresa tu Contraseña'),
                ),
                FadeInLeft(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                  child: ButtonWidget(
                    title: 'Log In',
                    width: 250.0,
                    height: 40.0,
                    otherColor: true,
                    colorButton: Colors.blue,
                    fontSize: 18,
                    hasBorder: false,
                    onPressed: () {
                      if (_controllerUSER.text.isEmpty ||
                          _controllerPASSWORD.text.isEmpty) {
                        Global.mensaje(
                            context, 'Debe rellenar todos los campos', 'Info');
                        return;
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Home(userLoggedd: _controllerUSER.text)));
                        return;
                      }
                    },
                  ),
                )),
              ],
            )));
          }),
        ));
  }
}
