import 'package:flutter/material.dart';
import 'package:notekeeper/screens/notedetail.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:notekeeper/models/note.dart';
import 'package:notekeeper/utils/database_helper.dart';

class NoteList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    //instantiate the note list if null
    if(noteList == null){
      noteList = List<Note>();
      updateListView();
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: (){
          debugPrint('Button pressed');
          navigateToDetail('Add note');
        },
        tooltip: 'Add note',
        child: Icon(Icons.add)
      ),
    );
  }

  ListView getNoteListView() {

    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
       return Card(
         color: Colors.white,
         elevation: 2.0,
         child: ListTile(
           leading: CircleAvatar(
             backgroundColor: getPriorityColor(this.noteList[position].priority),
             child: getPriorityIcon(this.noteList[position].priority),
           ),
           title:Text(this.noteList[position].title, style: titleStyle,),
           subtitle: Text(this.noteList[position].date),
           trailing: GestureDetector(
             child: Icon(Icons.delete, color: Colors.grey),
             onTap: (){
               _delete(context, noteList[position]);
             },
           ),
           onTap: () {
             navigateToDetail('Edit note');
           },
         ),
      );
      },
    );
  }

  // Return color according to priority
  Color getPriorityColor(int priority){
    switch(priority){
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      
      default:
        return Colors.yellow;
    }
  }

  //Return icon according to priority
  Icon getPriorityIcon(int priority){
    switch(priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;

      default:
      return Icon(Icons.keyboard_arrow_right);
    }
  }

  //Delete icon function
  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if(result !=0){
      _showSnackBar(context, 'Note deleted successfully');
      // update the list view
    }
  }

  //Display snackbar
  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  //
  void updateListView(){
    
  }
  
  // navigate to another screen
  void navigateToDetail(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(title);
    }));
  }
}


