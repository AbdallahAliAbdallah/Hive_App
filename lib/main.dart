import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hiveapp/notes_Screen.dart';
import 'package:path_provider/path_provider.dart';



Box? myBox;
Future<Box> openHiveBox(String boxname)async{
  if(!Hive.isBoxOpen(boxname)){
    Hive.init((await getApplicationDocumentsDirectory()).path);

  }
  return await Hive.openBox(boxname);
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
myBox =await openHiveBox('Abdallah');
  await Hive.openBox('Notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple
      ),
      home: const NotesScreen(),
    );
  }
}

