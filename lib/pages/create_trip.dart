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
            leading: BackButton(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text('Create Trip',
                style: GoogleFonts.nunito(
                    color: Colors.black, fontWeight: FontWeight.bold))),
        body: SafeArea(
            minimum: EdgeInsets.only(left: 15.0, right: 15.0),
            child: TripForm()));
  }
}

class TripForm extends StatefulWidget {
  @override
  _TripFormState createState() => _TripFormState();
}

class _TripFormState extends State<TripForm> {
  final _formKey = GlobalKey<FormState>(); // set form key
  String _trip; //trips
  List<String> _tripType = <String>[
    'Business',
    'Education',
    'Health',
    'Vacation'
  ];

  //date Format
  final timeFormat = DateFormat("HH:mm"); // set time format
  final dateFormat = DateFormat("yyyy-MM-dd");
  final Map<String, dynamic> tripData = {
    'departure': '',
    'departureDate': '',
    'departureTime': '',
    'destination': '',
    'destinationDate': '',
    'destinationTime': '',
    'triptype': ''
  };

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidate: true,
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter departure';
                    }
                  },
                  decoration: InputDecoration(labelText: 'Enter Departure'),
                  showCursor: true,
                  onSaved: (val) {
                    setState(() {
                      tripData['departure'] = val;
                    });
                  }),
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Column(children: <Widget>[
                      DateTimeField(
                          decoration: InputDecoration(labelText: 'Enter Date'),
                          format: dateFormat,
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
                          onSaved: (val) {
                            setState(() {
                              tripData['departureDate'] = val;
                            });
                          }),
                    ])),
                    SizedBox(width: 100),
                    Expanded(
                        child: Column(children: <Widget>[
                      DateTimeField(
                          decoration: InputDecoration(labelText: 'Enter Time'),
                          format: timeFormat,
                          onShowPicker: (context, currentValue) async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ?? DateTime.now()),
                            );
                            return DateTimeField.convert(time);
                          },
                          onSaved: (val) {
                            setState(() {
                              tripData['departureTime'] = val;
                            });
                          }),
                    ])),
                  ]),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                  validator: (String val) {
                    if (val.isEmpty) {
                      return 'Please enter destination';
                    }
                  },
                  decoration: InputDecoration(labelText: 'Enter Destination'),
                  showCursor: true,
                  onSaved: (val) {
                    setState(() {
                      tripData['destination'] = val;
                    });
                  }),
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Column(children: <Widget>[
                      DateTimeField(
                          decoration: InputDecoration(labelText: 'Enter Date'),
                          format: dateFormat,
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
                          onSaved: (val) {
                            setState(() {
                              tripData['destinationDate'] = val;
                            });
                          }),
                    ])),
                    SizedBox(width: 100),
                    Expanded(
                        child: Column(children: <Widget>[
                      DateTimeField(
                          decoration: InputDecoration(labelText: 'Enter Time'),
                          format: timeFormat,
                          onShowPicker: (context, currentValue) async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ?? DateTime.now()),
                            );
                            return DateTimeField.convert(time);
                          },
                          onSaved: (val) {
                            setState(() {
                              tripData['destinationTime'] = val;
                            });
                          }),
                    ])),
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15.0),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20.0),
                child: DropdownButton(
                    isExpanded: true,
                    hint: Text("Trip Type"),
                    value: _trip,
                    items: _tripType.map((value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                         _trip = value;
                        tripData['triptype'] = _trip;
                      });
                    }),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                elevation: 0.0,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
                color: Color(0XFF3E64FF),
                child: Text('Add Trip',
                    style: GoogleFonts.nunito(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form.validate()) {
                    form.save();
                    Scaffold.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color(0XFF3E64FF),
                          content: Text(
                            'Processing Data',
                            textAlign: TextAlign.center,
                            )));
                    print(tripData);
                  }
                },
              ),
            ),
          ],
        ));
  }
}
