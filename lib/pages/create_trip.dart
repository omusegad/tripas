import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class CreateTrip extends StatefulWidget {
  CreateTrip({Key key}) : super(key: key);

  @override
  _CreateTripState createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
     color: Colors.black
   ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title:Text('Create Trip', style: GoogleFonts.nunito(
                                            color: Colors.black, fontWeight: FontWeight.bold))
      ),
      body:SafeArea(
        minimum: EdgeInsets.only(left:15.0,right:15.0),
        child: TripForm())
    );
  }
}

class TripForm extends StatefulWidget {
  @override
  _TripFormState createState() => _TripFormState();
}

class _TripFormState extends State<TripForm> {
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom:8.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText:'Enter Departure'
            ),
            showCursor: true,
          ),
          ),
         Container(
           child: Row(
             mainAxisAlignment:MainAxisAlignment.spaceBetween ,
              children:<Widget>[
                  Expanded(
                  child: TextFormField(
                     decoration: InputDecoration(
              labelText:'Enter Date'
            ),
                  )),
                  SizedBox(width:100),
                  Expanded(
                  child: TextFormField(
                     decoration: InputDecoration(
              labelText:'Enter Time'
            ),
                  )),
        
              ]
            ),
         ),
           Padding(padding: EdgeInsets.only(bottom:8.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText:'Enter Destination'
            ),
            showCursor: true,
          ),
          ),
            Container(
           child: Row(
             mainAxisAlignment:MainAxisAlignment.spaceBetween ,
              children:<Widget>[
                  Expanded(
                  child: TextFormField(
                     decoration: InputDecoration(
              labelText:'Enter Date'
            ),
                  )),
                  SizedBox(width:100),
                  Expanded(
                  child: TextFormField(
                     decoration: InputDecoration(
              labelText:'Enter Time'
            ),
                  )),
        
              ]
            ),
         ),
       
        Container(
             width: MediaQuery.of(context).size.width,
            child: RaisedButton(   
              elevation: 0.0,
              shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                 color:Color(0XFF3E64FF),          
                child:Text('Add Trip',
                      style: GoogleFonts.nunito(
                        fontSize: 18.0,
                          color: Colors.white,fontWeight: FontWeight.bold)),
                
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // text in form is valid
                  }
                },
              ),
          ),
        ],

      )
      
    );
  }
}