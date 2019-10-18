import 'package:flutter/material.dart';

class ThemeColors{
    dynamic colorDark = ThemeData(brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        accentColor: Colors.grey[900],);

    dynamic colorLight = ThemeData(brightness: Brightness.light,
        primaryColor: Colors.blue[900],
        accentColor: Colors.blue[900],
        canvasColor: Colors.grey[300]);
}