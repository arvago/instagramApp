import 'package:flutter/material.dart';
import 'package:flutter_formulario/widgets/storie_widget.dart';
import 'package:flutter_formulario/widgets/textField_widget.dart';
import 'package:flutter_formulario/services/ProfileService.dart';
//import 'package:animate_do/animate_do.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.userLoggedd}) : super(key: key);
  final String? userLoggedd;

  @override
  State<Home> createState() => _Home(userLogged: userLoggedd);
}

class _Home extends State<Home> {
  _Home({this.userLogged});

  final String? userLogged;
  final TextEditingController _controllerSEARCH = TextEditingController();
  ProfileService profileService = ProfileService();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              toolbarHeight: 50.0,
              backgroundColor: Colors.white,
              elevation: 0.6,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.camera_alt_outlined,
                        size: 35.0, color: Colors.black),
                  ),
                  Image.network(
                      'https://www.instagram.com/static/images/web/logged_out_wordmark-2x.png/d2529dbef8ed.png',
                      width: 125),
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.person_outline,
                        size: 35.0, color: Colors.black),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
                  child: TextFieldWidget(
                    textColor: Colors.black,
                    isPrefixIcon: true,
                    isFilled: true,
                    maxLines: 1,
                    borderColor: const Color.fromARGB(255, 176, 176, 176),
                    backgrounColor: const Color(0xffffffff),
                    color: const Color.fromARGB(255, 176, 176, 176),
                    prefixIconData: Icons.search,
                    borderRadius: 50.00,
                    isMyController: true,
                    controller: _controllerSEARCH,
                    hintText: 'Search',
                    onChanged: (String value) {
                      print(userLogged);
                    },
                  ),
                ),
                Center(
                  child: Container(
                      height: 120.0,
                      decoration: const BoxDecoration(color: Color(0xfffafafa)),
                      child: Center(
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: const [
                            StoriesWidget(
                                url:
                                    'https://scontent.fgdl4-1.fna.fbcdn.net/v/t39.30808-6/273952173_480407623787979_7012244547504367710_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHZ9LJf7AKK-7QZiY-SEugHk3gP2dOn20OTeA_Z06fbQ-fXPOkhb_gfE4SwAtPkFM06rTBNITk77_zrKgVHWJ8i&_nc_ohc=Ks9TIZw8538AX9Xliet&_nc_ht=scontent.fgdl4-1.fna&oh=00_AT-sDTZKt2QOmDHl4e6xlmgZ7l6k5emwwZWAuFBmUHtspQ&oe=628BD988'),
                            StoriesWidget(
                                url:
                                    'https://scontent.fgdl4-1.fna.fbcdn.net/v/t39.30808-6/278270232_2080559468785223_8466566693637077269_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHCyYKEzLpdGSEVHulvmzOx2mVnckNE2WDaZWdyQ0TZYDqZmXnrnvQyQSIPzXk8wvj8mo8GgLdM1dQjTGmvYBuj&_nc_ohc=Gh3yx8JZN6AAX-gvDDX&tn=5wevxUiWWQ-cQCIZ&_nc_ht=scontent.fgdl4-1.fna&oh=00_AT-NURHQOaFhhOtCndS8KomMvDIq32OLYUNONDVVWpBlPA&oe=628B4752'),
                            StoriesWidget(
                                url:
                                    'https://scontent.fgdl4-1.fna.fbcdn.net/v/t39.30808-6/277567245_3264412243884956_7855363997134385343_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEI6359ihSVJTuiKAVb6pBxCL6Yo4c4C44IvpijhzgLjs4XVBHi0Qd_Yayr4_nMR7pySrDuzeT521vXUPUQjC9Z&_nc_ohc=Fjfne-P5Y70AX_ujMYQ&_nc_ht=scontent.fgdl4-1.fna&oh=00_AT8BclEXkGabN6Skz6aoMv5l7FECtr2NIsywZMkYYPz1dw&oe=628CA40A'),
                            StoriesWidget(
                                url:
                                    'https://i.pinimg.com/originals/f4/8e/a8/f48ea8538fdda42af3b3c8eaf9d0acf7.jpg'),
                            StoriesWidget(
                                url:
                                    'https://yt3.ggpht.com/ytc/AKedOLRjI68131sY_h0hUZkGgxqMDlKe-IosbR65zo476A=s900-c-k-c0x00ffffff-no-rj'),
                            StoriesWidget(
                                url:
                                    'https://yt3.ggpht.com/ytc/AKedOLQKnQTfUZYWrw_e95Xs-_kpz0CztA8o-9XHiTMpVw=s900-c-k-c0x00ffffff-no-rj'),
                            StoriesWidget(
                                url:
                                    'https://www.elreporterohn.com/wp-content/uploads/2022/02/Hollandtom.jpg')
                          ],
                        ),
                      )),
                ),
                Expanded(
                    child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(5),
                        child:
                            Row(mainAxisAlignment: MainAxisAlignment.center)),
                    Padding(
                        padding: const EdgeInsets.all(5),
                        child:
                            Row(mainAxisAlignment: MainAxisAlignment.center)),
                    Padding(
                        padding: const EdgeInsets.all(5),
                        child:
                            Row(mainAxisAlignment: MainAxisAlignment.center)),
                    Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center))
                  ],
                ))
              ],
            )));
  }
}
