class TripModel {
     int id;
     String departure;
     String departureDate;
     String departureTime;
     String destination;
     String destinationDate;
     String destinationTime;
     String triptype;

    TripModel({
    this.id,
    this.departure,
    this.departureDate,
    this.departureTime,
    this.destination,
    this.destinationDate,
    this.destinationTime,
    this.triptype,
    });

    factory TripModel.fromMap(Map<String, dynamic> data) => TripModel(
        id:data['id'],
        departure: data["departure"],
        departureDate: data["departureDate"],
        departureTime: data["departureTime"],
        destination: data["destination"],
        destinationDate: data["destinationDate"],
        destinationTime: data["destinationTime"],
    );

    Map<String, dynamic> toMap() => {
        "id":id,
        "departure": departure,
        "departureDate": departureDate,
        "departureTime": departureTime,
        "destination": destination,
        "destinationDate": destinationDate,
        "destinationTime": destinationTime,
    };


}