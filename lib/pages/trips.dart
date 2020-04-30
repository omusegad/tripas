import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripas/menus/popup.dart';

class Trips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                      child: Text(
                    'Hello, Gad',
                    textDirection: TextDirection.ltr,
                    style: GoogleFonts.nunito(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                ),
                FlatButton(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 8.0, bottom: 8.0),
                    child: Text(
                      '20 trips',
                      style: GoogleFonts.nunito(
                          color: Colors.white, fontSize: 18.0),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Color(0XFF3E64FF)),
                  ),
                  textColor: Colors.white,
                  onPressed: null,
                )
              ],
            ),
            Container(
                width: 300,
                padding: EdgeInsets.only(top: 20.0, left: 15.0, bottom: 20.0),
                child: Text(
                  'Create Your Trips with us',
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.nunito(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF020202)),
                )),
            TripBoards()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0XFF3E64FF),
        onPressed: null,
        child: Icon(Icons.add, size: 35),
      ),
    );
  }
}

var cards = List<int>.generate(50, (i) => i + 1);

class TripBoards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        addRepaintBoundaries: false,
      itemCount: cards.length,
        itemBuilder: (context, position) {
          return Container(
            decoration: new BoxDecoration(
              boxShadow: [
                BoxShadow(
                  //color: Colors.black.withOpacity(.1),
                  color: Color.fromRGBO(185, 187, 193, 0.25),
                  blurRadius: 70.0, // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    10.0, // Move to right 10  horizontally
                    10.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: Card(
              borderOnForeground: false,
              elevation: 0,
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, left: 15.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lagos',
                                    style: GoogleFonts.nunito(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7.0),
                                    child: Text('Mon, 23 2020',
                                        style: GoogleFonts.nunito(
                                            color: Color(0XFFA5A2A2))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7.0),
                                    child: Text('12: 30pm',
                                        style: GoogleFonts.nunito(
                                            color: Color(0XFFA5A2A2))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0XFF3E64FF),
                                        borderRadius:BorderRadius.circular(3.0)
                                      ),
                                      padding: EdgeInsets.only(
                                          top: 3.0,
                                          bottom: 3.0,
                                          left: 15.0,
                                          right: 15.0),
                                      child: Text(
                                        'Business',
                                        style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          )
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FaIcon(FontAwesomeIcons.plane,
                              size: 11.0, color: Color(0XFFA6A7AB)),
                          SizedBox(height: 67)
                        ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'London',
                              style: GoogleFonts.nunito(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7.0),
                              child: Text('Mon, 23 2020',
                                  style: GoogleFonts.nunito(
                                      color: Color(0XFFA5A2A2))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7.0),
                              child: Text('12: 30pm',
                                  style: GoogleFonts.nunito(
                                      color: Color(0XFFA5A2A2))),
                            ),
                            PopupChoices(),
                            // FlatButton(
                            //     onPressed:null , child: Icon(Icons.more_vert))
                          ]),
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}


///pop menu
