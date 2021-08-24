import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../db/db_manager.dart';
import '../db/journal_entry_dto.dart';

import '../models/jorunal_entry.dart';

class EntryForm extends StatefulWidget {
  final entry = JournalEntry();
  final entryInput = JournalEntryDTO();
  final modifier;

  EntryForm({Key key, this.modifier}) : super(key : key);

  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final _formkey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Form(
        key: _formkey,
        child: Column(children: <Widget>[
          entryFieldText(label: 'Title'),
          entryFieldText(label: 'Body'),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            formbutton(label: "Cancel", color: Colors.grey[600], pressFunc: () {Navigator.of(context).pop();}),
            formbutton(label: "Save", color: Colors.grey, pressFunc: () {  pressSave();  }),
            ],)
        ],
        ),
      ),
    );
  }

  Widget entryFieldText({label}){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: label, border: OutlineInputBorder()
        ),
        onSaved: (val) {
          switch(label){
            case('Title') : widget.entryInput.title = val; break;
            case('Body') : widget.entryInput.body = val; break;
          }
        },
      ),
    );
  }

  Widget formbutton({label, pressFunc, color}) {
    return Padding(
      padding: const EdgeInsets.all(15),
      
        child: Column(children: [
            ElevatedButton(
              onPressed: pressFunc, 
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(24),
              ), 
              child: Text(label, style: TextStyle(color: Colors.white)),
            )
          ])
        );
  }

  void defDate() {
    var formatting = DateFormat('EEEE, MMMM d, y');
    widget.entryInput.date = formatting.format(DateTime.now());
  }

  void pressSave(){
    if(_formkey.currentState.validate()){
      defDate();
      final dbManager = DatabaseManager.getInstance();

      _formkey.currentState.save();
      dbManager.saveJournalEntry(entry: widget.entryInput);
      widget.modifier(JournalEntry(body: widget.entryInput.body, title: widget.entryInput.title, date: widget.entryInput.date,));
      
      Navigator.of(context).pop();
    }
  }
}
