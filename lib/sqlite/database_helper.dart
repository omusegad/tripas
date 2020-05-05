import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tripas/model/trips_model.dart';


class DatabaseHelper {

	static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
	static Database _db;                // Singleton Database

 /// database columns 
  static const String id               = 'id';
  static const String departure        = 'departure';
  static const String departureDate    = 'departureDate';
  static const String departureTime    = 'departureTime';
  static const String destination      = 'destination';
  static const String destinationDate  = 'destinationDate';
  static const String destinationTime  = 'destinationTime';
  static const String triptype         = 'triptype';
  static const String customertrips    = 'customer_trips';

	DatabaseHelper._(); // Named constructor to create instance of DatabaseHelper

	factory DatabaseHelper() {

		if (_databaseHelper == null) {
			   _databaseHelper   = DatabaseHelper._(); // This is executed only once, singleton object
		}
		return _databaseHelper;
	}

	Future<Database> get db async {
		if (_db != null) {
		    return _db;
		}
    	_db = await initializeDatabase();
		  return _db;
	}

	Future<Database> initializeDatabase() async {
    String databasesPath = await getDatabasesPath();	// Get the directory path for both Android and iOS to store database.
		String path = join(databasesPath + 'trips.db');
		// Open/create the database at a given path
		var db = await openDatabase(path, version: 1, onCreate: _createDb);
		return db;
	}

	void _createDb(Database db, int newVersion) async {
		await db.execute('CREATE TABLE $customertrips($id INTEGER PRIMARY KEY AUTOINCREMENT, $departure TEXT, $departureDate TEXT,$departureTime TEXT, $destination TEXT, $destinationDate TEXT, $destinationTime TEXT, $triptype TEXT, $customertrips TEXT)');
	
  }

	// Insert records into db
  Future<TripModel> createTrip(TripModel trip) async {
    var dbClient = await db;
    trip.id = await dbClient.insert(customertrips, trip.toMap());
    return trip;
  }

// get all trips
	Future<List<TripModel>> getTrips() async {
	   var dbClient = await db;
		 List<Map> result = await dbClient.query(customertrips);
		 List<TripModel>  trips = [];
     if(result.length > 0){
      for(int i = 0; i <result.length; i++)
            trips.add(TripModel.fromMap(result[i]));
     }
     return trips;
	}

	// Update Operation: Update a todo object and save it to database
	Future<int> updateTrip(TripModel tripmodel) async {
		var dbClient = await db;
		var result = await dbClient.update(customertrips, tripmodel.toMap(), where: '$id = ?', whereArgs: [tripmodel.id]);
		return result;
	}


	// Delete Operation: Delete a todo object from database
	Future<int> deleteTrip(int id) async {
		var dbClient = await db;
		int result = await dbClient.rawDelete('DELETE FROM $customertrips WHERE $id = $id');
		return result;
	}

	// Get number of todo objects in database
	Future<int> getCount() async {
		var dbClient = await db;
		List<Map<String, dynamic>> x = await dbClient.rawQuery('SELECT COUNT (*) from $customertrips');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

Future close() async{
  var dbClient = await db;
   dbClient.close();
}


}



