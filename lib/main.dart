import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String host = 'https://jsonplaceholder.typicode.com/posts';

  @override
  void initState() {
    super.initState();
  }
  getData() => http.get(host);

  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(title: Text('Get data from json by http')),
      body:
          FutureBuilder( future: getData(), builder: (context, snap) {
            if ( ! snap.hasData) {
              return Container();
            }
            List datas = jsonDecode(snap.data.body);
            return ListView.builder(
                itemCount: datas.length,
                itemBuilder: (context, idx) {
                  var data = datas[idx];
                  return ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text(data['title']),
                    subtitle: Text(data['body']),
                  );
                }
            );
          })
    );
  }
}


