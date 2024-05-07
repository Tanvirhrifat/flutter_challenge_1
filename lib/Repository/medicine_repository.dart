import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

class MedicineRepository {
  static const String _databaseName = 'medicine.db';
  static Database? _database;

  Future<Database> _initDatabase() async {
    if (_database != null) {
      return _database!;
    }

    var databasesPath = await getDatabasesPath();
    var dbPath = join(databasesPath, _databaseName);

    if (!(await databaseExists(dbPath))) {
      ByteData data = await rootBundle.load('assets/medicine.db');
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await Directory(dirname(dbPath)).create(recursive: true);
      await File(dbPath).writeAsBytes(bytes, flush: true);
    }

    _database = await openDatabase(dbPath, readOnly: true);
    return _database!;
  }

  Future<List<Map<String, dynamic>>> fetchMedicines() async {
    final db = await _initDatabase();
    return await db.rawQuery(
        '''
      SELECT brand.*, company.company_name, generic.generic_name
      FROM brand
      JOIN company_name AS company ON brand.company_id = company.company_id
      JOIN generic AS generic ON brand.generic_id = generic.generic_id
      '''
    );
  }
}
