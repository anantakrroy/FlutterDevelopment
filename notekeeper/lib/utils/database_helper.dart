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
Future<List<Map<String, dynamic>>> getNoteMapList() async{
  Database db = await this.database;
  var result = await db.query(noteTable,orderBy: '$colPriority ASC');
  return result;
}

//INSERT
Future<int> insertNote(Note note) async{
  Database db = await this.database;
  var result = await db.insert(noteTable, note.toMap());
  return result;
}

//UPDATE
Future<int>updateNote(Note note) async{
  var db = await this.database;
  var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
}

//DELETE 
Future<int> deleteNote(int id) async{ 
  var db = await this.database;
  int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
  return result;
}

//Get number of note objects in database
Future<int> getCount()async {
  Database db = await this.database;
  List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
  int result = Sqflite.firstIntValue(x);
  return result;
}

//Get the 'Map List' [List<Map>] and convert it to 'Note List' [List<Note>]
Future<List<Note>> getNoteList() async {
  var noteMapList = await getNoteMapList(); // maplist from db
  int count = noteMapList.length;           // count number of maplist entries

  List<Note> noteList = List<Note>();
  // for loop to add map list entries to ntoe list into above empty notelist
  for(int i =0; i< count; i++){
    noteList.add(Note.fromMapObject(noteMapList[i]));
  }
  return noteList;
}

}