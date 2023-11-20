import 'package:flutter/material.dart';
import 'dart:async';
import 'shinchan_model.dart';
import 'shinchan_list.dart';
import 'new_shinchan_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shin-chan',
      theme: ThemeData(brightness: Brightness.dark),
      home: const MyHomePage(
        title: 'Shin-chan',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ShinChanChar> initialShinChan = [ShinChanChar("Shiro"), ShinChanChar("Shinnosuke"), ShinChanChar("Nanako"), ShinChanChar("Ai")];

  Future<void> _showNewShinChanForm() async {
  ShinChanChar? newShinChan = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return const AddShinChanFormPage();
  }));

  if (newShinChan != null) {
    initialShinChan.add(newShinChan);
    setState(() {
      
    });
  } else {
    
  }
}

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 102, 148, 221),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showNewShinChanForm,
          ),
        ],
      ),
      body: Container(
          color: Color.fromARGB(255, 0, 0, 0),
          child: Center(
            child: ShinChanList(initialShinChan),
          )),
    );
  }
}
