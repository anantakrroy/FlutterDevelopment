class Note {
  int _id;
  String _title;
  String _description;
  int _priority;
  String _date;

  //named and unnamed constructors

  Note(this._title, this._date, this._priority,[this._description]);

  Note.withId(this._id, this._title, this._date, this._priority,[this._description]);
  
  //time for getters
  int get id => _id;

  String  get title => _title;

  String get description => _description;

  String get date => _date;

  int get priority => _priority;

  // setting the setters
  set title(String newTitle) {
    //validation
    if(newTitle.length < 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription){
    if(newDescription.length < 255){
      this._description = newDescription;
    }
  }

  set date(String newDate){
    this._date = newDate;
  }

  set priority(int newPriority) {
    if(newPriority >= 1 && newPriority <= 2){
      this._priority = newPriority;
    }
  } 

  //convert a note object into MAP object
  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();

    if(_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;
    
    return map;
  }

  //extract a note object from the map object
  Note.fromMapObject(Map<String, dynamic> map){
    this._id = map['id'];
    this.title = map['title'];
    this.description = map['description'];
    this.priority = map['priority'];
    this.date = map['date'];
  }

}