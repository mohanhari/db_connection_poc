import 'package:postgres/postgres.dart';

class DbConnection{
  String name;
  String host;
  String defaultDB;
  String username;
  String password;
  int port;
  var connection;
  List<Map<String, Map<String, dynamic>>> results;


  DbConnection({this.name, this.host, this.defaultDB, this.username, this.password, this.port});

  Future<void> dbConnection() async {
    connection = new PostgreSQLConnection(host, port, defaultDB, username: username, password: password);
    await connection.open();
  }

  Future<void> executeQuery () async {
    await dbConnection();
    results = await connection.mappedResultsQuery(
        "SELECT * FROM tetsing");
  }

}