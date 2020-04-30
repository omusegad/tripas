
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripas/menus/popup.dart';

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
