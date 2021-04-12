import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_hive_db/screens/home-page.screens.dart';
import 'package:todo_hive_db/utilities/task-model.utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TaskAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: Hive.openBox('tasks'),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? HomePage()
              : Scaffold(
                  backgroundColor: Colors.deepPurple,
                  body: Center(
                    child: Icon(
                      Icons.list_alt,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
