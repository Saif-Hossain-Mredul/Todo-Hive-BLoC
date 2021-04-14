import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo_hive_db/BLoC/database_bloc.dart';
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
    return MultiProvider(
      providers: [
        BlocProvider<DatabaseBloc>(
          create: (context) => DatabaseBloc()..add(InitEvent()),
        )
      ],
      child: MaterialApp(
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
                    backgroundColor: Colors.white,
                    body: Center(
                      child: Icon(
                        Icons.list_alt,
                        color: Colors.purple,
                        size: 80,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
