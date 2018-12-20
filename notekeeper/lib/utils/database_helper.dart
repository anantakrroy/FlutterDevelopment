import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:notekeeper/models/note.dart';

class DatabaseHelper{

static DatabaseHelper _databaseHelper;  //singleton object(DatabaseHelper)
static Database _database;              //singleton object (Database) 

String noteTable = 'note-table';
String colId = 'id';
String colTitle = 'title';
String colDescription = 'description';
String colPriority = 'priority';
String colDate = 'date';

DatabaseHelper.createInstance();   //named constructor to create instance of DatabaseHelper

factory DatabaseHelper() {        //allows to return a value
    if(_databaseHelper == null) {
      _databaseHelper = DatabaseHelper.createInstance();   //initialise object(calling named constructor)
    }
  return _databaseHelper;         //return the singleton i.e databasehelper instance
}

//creating the getter for the _database reference variable
Future<Database> get database async{
  if(_database == null) {
    _database = await initialiseDatabase();
  }
  return _database;
}

Future<Database> initialiseDatabase() async{
  //Get the directory path for both Android and iOS where we can store DB
  Directory directory = await  getApplicationDocumentsDirectory();
  String path = directory.path + 'notes.db';

  //open database at given path
  var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
  return notesDatabase;
}

void _createDb(Database db, int newVersion) async {     //function to create DB
    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colPriority INT,$colDate TEXT)');
  }

//functions for CRUD

//FETCH
getNoteMapList() async{
  Database db = await this.database;
  var result = await db.query(noteTable,orderBy: '$colPriority ASC');
  return result;
}

}