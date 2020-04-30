import 'package:tripas/routes/router_const.dart';
import 'package:flutter/material.dart';
import 'package:tripas/pages/create_trip.dart';
import 'package:tripas/pages/trips.dart';


class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case HomeRouter:
        return MaterialPageRoute(builder: (context) => Trips() );
      case CreateTripsRouter:
        return MaterialPageRoute(builder: (context) => CreateTrip() );
      default:
        return MaterialPageRoute(builder: (context) => Errorroute() );
    }
  }
  
} 

class Errorroute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child:Text('UNDEFINED ROUTE ')
      )
    );
  }
}