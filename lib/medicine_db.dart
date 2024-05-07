import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

// Future<Database> initDatabase() async {
//   var databasesPath = await getDatabasesPath();
//   var dbPath = join(databasesPath, 'medicine.db');
//
//   // Check if the database exists
//   var exists = await databaseExists(dbPath);
//
//   if (!exists) {
//     // If not, copy it from assets
//     try {
//       await Directory(dirname(dbPath)).create(recursive: true);
//     } catch (e) {
//       print("Error creating directory: $e");
//     }
//
//     ByteData data = await rootBundle.load('assets/medicine.db');
//     List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//
//     await File(dbPath).writeAsBytes(bytes, flush: true);
//   }
//
//   return openDatabase(dbPath, readOnly: true);
// }
//
// Future<List<Map<String, dynamic>>> fetchMedicines() async {
//   final db = await initDatabase();
//   try {
//     final results = await db.query('brand');
//     return results;
//   } catch (e) {
//     print("Error fetching data: $e");
//     throw e;
//   }
// }

Future<Database> initDatabase() async {
  var databasesPath = await getDatabasesPath();
  var dbPath = join(databasesPath, 'medicine.db');

  if (!(await databaseExists(dbPath))) {
    ByteData data = await rootBundle.load('assets/medicine.db');
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    await Directory(dirname(dbPath)).create(recursive: true);
    await File(dbPath).writeAsBytes(bytes, flush: true);
  }

  return openDatabase(dbPath, readOnly: true);
}

Future<List<Map<String, dynamic>>> fetchMedicines() async {
  final db = await initDatabase();
  return await db.rawQuery(
      '''
    SELECT brand.*, company.company_name, generic.generic_name
    FROM brand
    JOIN company_name AS company ON brand.company_id = company.company_id
    JOIN generic AS generic ON brand.generic_id = generic.generic_id
    '''
  );
}
