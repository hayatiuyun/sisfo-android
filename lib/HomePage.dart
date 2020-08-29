import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_app/Detail.dart';
import 'package:my_app/model.dart';
import 'cari.dart';
import 'constant.dart';
import 'dart:convert';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterSecureStorage storage;
  String value_login = '';
  String noUser = '';
  var nama = "";

  List<Login> _items = [];
  void initState() {
    super.initState();
    storage = FlutterSecureStorage();
    read();
  }

  void read() async {
    var stopwatch = new Stopwatch()..start();

    value_login = await storage.read(key: "login");
    var namax = await storage.read(key: "nama");
    setState(() {
      noUser = value_login;
      nama = namax;
    });
  }

  @override
  Widget build(BuildContext context) {
    String nim = '';
    String foto = '';
    print(nama);
    String nama_tools = '';
    String getnama_tools;

    Widget header() {
      final String header = 'images/svg/logo_header.png';
      return Row(
        children: <Widget>[
          Image(
            image: AssetImage(header),
            width: MediaQuery.of(context).size.width / 2.15,
          )
        ],
      );
    }

    var rectHeadNote = Container(
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 30,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: RichText(
                text: TextSpan(
                  text: "HALO " + nama.toUpperCase(),
                  style: TextStyle(
                      color: mainColor,
                      fontFamily: 'Open Sans',
                      fontSize: MediaQuery.of(context).size.height / 21,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7, left: 0.0),
              child: Text('''Perlu Alat?
Cari dan pinjam alat lewat aplikasi''',
                  style: TextStyle(
                    fontSize: 15,
                    color: textColor,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  )),
            )
          ],
        ),
      ),
    );

    var headNotes = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          child: rectHeadNote,
        ),
      ],
    );

    var lineDivider = Divider(
      color: Colors.black54,
      height: 0,
      thickness: 0.5,
      indent: 10,
      endIndent: 10,
    );

    var messageBar = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(
        children: <Widget>[
          RichText(
              text: TextSpan(
                  text: "4 Alat",
                  style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      fontSize: 13,
                      color: Colors.red),
                  children: <TextSpan>[
                TextSpan(
                    text: ' belum dikembalikan',
                    style: TextStyle(fontWeight: FontWeight.normal))
              ])),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: ButtonBar(
              alignment: MainAxisAlignment.end,
              buttonHeight: 5,
              children: <Widget>[
                FlatButton(
                    onPressed: () {},
                    padding: new EdgeInsets.only(
                        top: 6.7, bottom: 6.7, left: 10, right: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: mainColor2,
                    child: Text(
                      "Kembalikan",
                      style: TextStyle(
                          color: mainColor,
                          fontFamily: 'Open Sans',
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          )
        ],
      ),
    );
    var buttonPinjamKembali = ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonHeight: 10,
        buttonMinWidth: MediaQuery.of(context).size.width / 5,
        buttonPadding: EdgeInsets.only(left: 10, right: 10),
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              log("jasl");
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushNamed('/KembaliPage');
              });
            },
            padding: new EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 15,
                vertical: MediaQuery.of(context).size.height / 30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Column(
              // Replace with a Row for horizontal icon + text
              children: <Widget>[
                SvgPicture.asset(
                  "images/svg/kembali_ico.svg",
                  height: MediaQuery.of(context).size.width / 6,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Kembali",
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      color: textColor,
                      letterSpacing: 1.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/PinjamPage');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: new EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 12,
                vertical: MediaQuery.of(context).size.height / 30),
            color: Colors.white,
            child: Column(
              // Replace with a Row for horizontal icon + text
              children: <Widget>[
                SvgPicture.asset(
                  "images/svg/pinjam_ico.svg",
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.width / 6,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Pinjam",
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      color: textColor,
                      letterSpacing: 1.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe6edf4),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Image.asset(
          "images/svg/logo_header.png",
          alignment: Alignment.centerLeft,
          width: 160,
        ),
        centerTitle: false,
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(children: <Widget>[
          Container(
            color: bgColor,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              child: Column(
                children: <Widget>[
                  // header(),
                  headNotes,
                  // lineDivider,
                  // messageBar,
                  buttonPinjamKembali,
                ],
              ),
            ),
          )
        ]),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     scan();
      //   },
      //   child: Icon(FontAwesome5.qrcode),
      //   backgroundColor: mainColor,
      // ),
      // bottomNavigationBar: BottomAppBar(
      //     notchMargin: 15,
      //     color: Colors.white,
      //     shape: CircularNotchedRectangle(),
      //     child: Container(
      //       height: 50,
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //         child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               Icon(
      //                 FontAwesome5.home,
      //                 size: 26.0,
      //                 color: blackIcon,
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(right: 40.0),
      //                 child: Icon(
      //                   FontAwesome5.search,
      //                   size: 26.0,
      //                   color: blackIcon,
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 45.0),
      //                 child: Icon(
      //                   FontAwesome5.history,
      //                   size: 26.0,
      //                   color: blackIcon,
      //                 ),
      //               ),
      //               Icon(
      //                 FontAwesome5.user,
      //                 size: 26.0,
      //                 color: blackIcon,
      //               )
      //             ]),
      //       ),
      //     )),
    );
  }
}
