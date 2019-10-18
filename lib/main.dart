import 'package:db_connection_poc/Themes/ThemeChanger.dart';
import 'package:db_connection_poc/Themes/ThemeColors.dart';
import 'package:db_connection_poc/utils/ConnectionForm.dart';
import 'package:db_connection_poc/utils/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider<ThemeChanger>(
    builder: (_) => ThemeChanger(ThemeColors().colorLight),
    child: new MaterialAppWithTheme(),
  )
);

class MaterialAppWithTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/connection_form': (context) => ConnectionForm()
      },
      theme: theme.getTheme(),
    );
  }
}
