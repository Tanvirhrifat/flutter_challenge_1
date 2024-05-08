import 'dart:io'; // Provides access to file and directory operations
import 'package:sqflite/sqflite.dart'; // SQLite package for Flutter
import 'package:path/path.dart'; // For manipulating file paths
import 'package:flutter/services.dart'; // For accessing assets

class MedicineRepository {
  static const String _databaseName = 'medicine.db'; // Name of the SQLite database
  static Database? _database; // Optional variable to hold the database instance

  // Initializes the database, loading it from the assets folder if necessary
  Future<Database> _initDatabase() async {
    if (_database != null) {
      return _database!; // Return the existing database instance if it's already initialized
    }

    // Get the path for the device's databases
    var databasesPath = await getDatabasesPath();
    var dbPath = join(databasesPath, _databaseName); // Full path to the database file

    // If the database doesn't exist, load it from the assets folder
    if (!(await databaseExists(dbPath))) {
      ByteData data = await rootBundle.load('assets/medicine.db'); // Load from assets
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes); // Convert to bytes

      // Create the directory for the database if it doesn't exist
      await Directory(dirname(dbPath)).create(recursive: true);
      // Write the bytes to the database file
      await File(dbPath).writeAsBytes(bytes, flush: true);
    }

    // Open the database in read-only mode and assign it to _database
    _database = await openDatabase(dbPath, readOnly: true);
    return _database!;
  }

  // Fetches the list of medicines from the database
  Future<List<Map<String, dynamic>>> fetchMedicines() async {
    final db = await _initDatabase(); // Ensure the database is initialized
    return await db.rawQuery(
        '''
      SELECT brand.*, company.company_name, generic.generic_name
      FROM brand
      JOIN company_name AS company ON brand.company_id = company.company_id
      JOIN generic AS generic ON brand.generic_id = generic.generic_id
      ''' // SQL query to get data from several tables
    );
  }
}
