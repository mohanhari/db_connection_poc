import 'package:db_connection_poc/Themes/ThemeChanger.dart';
import 'package:db_connection_poc/Themes/ThemeColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool val = false;

  void switchTheme(value, _themeChanger){
    val = value;
    if(value)
      _themeChanger.setTheme(ThemeColors().colorDark);
    else
      _themeChanger.setTheme(ThemeColors().colorLight);
  }

  onSwitchValueChange (value) {
    setState(() {
      val = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Francium SQL'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Dark Theme'),
                  Switch(
                    value: val,
                    onChanged: (newVal) {
                      switchTheme(newVal, _themeChanger);
                    },
//                    activeThumbImage: new NetworkImage('https://lists.gnu.org/archive/html/emacs-devel/2015-10/pngR9b4lzUy39.png'),
//                    inactiveThumbImage: new NetworkImage('http://wolfrosch.com/_img/works/goodies/icon/vim@2x'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/connection_form");
        },
      ),
    );
  }
}
