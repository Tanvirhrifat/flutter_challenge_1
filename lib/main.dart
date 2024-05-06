import 'package:flutter/material.dart';
import 'medicine_db.dart';  // Import the database initialization logic

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine List',
      home: MedicineListScreen(),
    );
  }
}

class MedicineListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicines"),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchMedicines(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final medicines = snapshot.data ?? [];

          return ListView.builder(
            itemCount: medicines.length,
            itemBuilder: (context, index) {
              final medicine = medicines[index];
              return ListTile(
                title: Text(medicine['brand_name'] ?? 'No name'),
                subtitle: Text(
                    '${medicine['form']} - ${medicine['strength']}'),
                trailing: Text('${medicine['price']} USD'),
              );
            },
          );
        },
      ),
    );
  }
}
