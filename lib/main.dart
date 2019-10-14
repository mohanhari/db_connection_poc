import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:db_connection_poc/utils/db_connection.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DbConnection connection = DbConnection(name: 'testconnection', host: 'john.db.elephantsql.com', port: 5432, defaultDB: 'uhgtvsox', username: 'uhgtvsox', password: 'TsylJ19OG7n2Axjuq2fFwv89KEMfd8G5');

  void setupConnection () async{
    setState(() {
      connection.executeQuery();
      print(connection.results);
    });
  }

  @override
  void initState() {
    super.initState();
    setupConnection();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${connection.results}',
            ),
            SizedBox(height: 30.0),
//            Table(
//              border: TableBorder.all(width: 1.0, color: Colors.black),
//              children: [
//                TableRow(children: [
//                  Text("${connection.results[0]['tetsing']['id']}"),
//                  Text("${connection.results[0]['tetsing']['value']}"),
//                ]),
//                TableRow(children: [
//                  Text("${connection.results[1]['tetsing']['id']}"),
//                  Text("${connection.results[1]['tetsing']['value']}"),
//                ]),
//              ]
//            ),
          ],
        ),
      ),
    );
  }
}
