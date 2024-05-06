import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

// Function to initialize the SQLite database
Future<Database> initDatabase() async {
  var databasesPath = await getDatabasesPath();
  var dbPath = join(databasesPath, 'medicine.db');

  // Check if the database exists
  var exists = await databaseExists(dbPath);

  if (!exists) {
    // If not, copy it from assets
    try {
      await Directory(dirname(dbPath)).create(recursive: true);
    } catch (e) {
      print("Error creating directory: $e");
    }

    ByteData data = await rootBundle.load('assets/medicine.db');
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    await File(dbPath).writeAsBytes(bytes, flush: true);
  }

  return openDatabase(dbPath, readOnly: true);
}

// Function to fetch data from the 'medicine' table
Future<List<Map<String, dynamic>>> fetchMedicines() async {
  final db = await initDatabase();
  try {
    final results = await db.query('brand');
    return results;
  } catch (e) {
    print("Error fetching data: $e");
    throw e;
  }
}
