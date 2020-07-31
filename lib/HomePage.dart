import 'dart:developer';

import 'package:flutter/material.dart';
import 'constant.dart';
import 'dart:convert';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'icons/widget_icon_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  final NO_user;
  HomePage({this.NO_user});

  @override
  Widget build(BuildContext context) {
    String nim = '';
    String foto = '';
    var nO_user1 = json.decode(NO_user);
    var nama = nO_user1["nama"];
    print(nO_user1["nama"]);

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

    var rectHeadNote = ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
      child: Container(
        height: MediaQuery.of(context).size.height / 3.5,
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: RichText(
            text: TextSpan(
                text: "Halo " + nama,
                style: TextStyle(
                    color: mainColor,
                    fontSize: MediaQuery.of(context).size.height / 21,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w700),
                children: <TextSpan>[
                  TextSpan(
                      text: ''' 
''',
                      style: TextStyle(
                        fontSize: 15,
                        color: mainColor,
                        fontWeight: FontWeight.w300,
                        height: 1,
                      )),
                  TextSpan(
                      text: '''
                                      
Perlu Alat?
Cari dan pinjam alat lewat aplikasi
                                      ''',
                      style: TextStyle(
                        fontSize: 15,
                        color: mainColor,
                        fontWeight: FontWeight.w300,
                        height: 1,
                      ))
                ]),
          ),
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
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.red),
                  children: <TextSpan>[
                TextSpan(
                    text: ' belum dikembalikan',
                    style: TextStyle(fontWeight: FontWeight.normal))
              ])),
          Padding(
            padding: EdgeInsets.only(left: 15),
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
                      style: TextStyle(color: mainColor),
                    )),
                FlatButton(
                    onPressed: () {},
                    padding: new EdgeInsets.only(
                        top: 6.7, bottom: 6.7, left: 10, right: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.red,
                    child: Text(
                      "Nanti saja",
                      style: TextStyle(color: mainColor2),
                    ))
              ],
            ),
          )
        ],
      ),
    );
    return Scaffold(
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
                  header(),
                  headNotes,
                  lineDivider,
                  messageBar,
                  ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonHeight: 10,
                      buttonMinWidth: MediaQuery.of(context).size.width / 5,
                      buttonPadding: EdgeInsets.only(left: 10, right: 10),
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {},
                          padding: new EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 18,
                              vertical:
                                  MediaQuery.of(context).size.height / 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
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
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  "Kembali",
                                  style: TextStyle(color: mainColor2),
                                ),
                              )
                            ],
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: new EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 18,
                              vertical:
                                  MediaQuery.of(context).size.height / 30),
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
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  "Pinjam",
                                  style: TextStyle(color: mainColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ])
                ],
              ),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(FontAwesome5.qrcode),
        backgroundColor: mainColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          notchMargin: 15,
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      size: 26.0,
                      color: blackIcon,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Icon(
                        Icons.search,
                        size: 26.0,
                        color: blackIcon,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: Icon(
                        Icons.history,
                        size: 26.0,
                        color: blackIcon,
                      ),
                    ),
                    Icon(
                      Icons.person,
                      size: 26.0,
                      color: blackIcon,
                    )
                  ]),
            ),
          )),
    );
  }
}
