import 'package:flutter/material.dart';

class JournalScaffold extends StatefulWidget {

  static const route = '/';

  final body;
  final floatingActionButton;
  final modifier;
  final state;
  final String title;

  JournalScaffold({Key key, @required this.body, this.floatingActionButton, this.title, this.modifier, this.state}) : super(key : key);
  
  @override
  _JournalScaffoldState createState() => _JournalScaffoldState();
}

class _JournalScaffoldState extends State<JournalScaffold> {
    final lists = List<Map>.generate(200, (index) {
    return {
      'title' : 'Journal entry $index',
      'subtitle' : 'Subtitle $index'
    };
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          Builder(builder: (context) => 
          IconButton(icon: Icon(Icons.settings), 
            onPressed: () => Scaffold.of(context).openEndDrawer()
            ,tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,),)
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 60,
              child: DrawerHeader(
                child: Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Row(children: <Widget>[
                Align(alignment: Alignment.center, child: Text('Change Mode', style: TextStyle(fontWeight: FontWeight.bold))),
                Align(alignment: Alignment.center, 
                  child: Switch(value: widget.state, 
                    onChanged: (value) {
                      widget.modifier(value); 
                       }))
              ],),
            )
          ],
        )
      ),
      floatingActionButton: hasFloatingActionButton(),
      body: widget.body,
    );
    /*
    return ThemeDrawer(key: widget.key, body: widget.body,
     floatingActionButton: widget.floatingActionButton, title: widget.title,
     state: widget.state, modifier: widget.modifier);
     */
  }
  hasFloatingActionButton() {
    return widget.floatingActionButton ?? Container();
  }
}