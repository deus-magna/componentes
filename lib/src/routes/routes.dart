import 'package:componentes/src/screens/alert_screen.dart';
import 'package:componentes/src/screens/animated_container.dart';
import 'package:componentes/src/screens/avatar_screen.dart';
import 'package:componentes/src/screens/card_screen.dart';
import 'package:componentes/src/screens/gradient_screen.dart';
import 'package:componentes/src/screens/home_screen.dart';
import 'package:componentes/src/screens/input_screen.dart';
import 'package:componentes/src/screens/listview_screen.dart';
import 'package:componentes/src/screens/slider_screen.dart';
import 'package:flutter/material.dart';

// Nos regresa todas las rutas de la app
Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomeScreen(),
    'alert': (BuildContext context) => AlertScreen(),
    'avatar': (BuildContext context) => AvatarScreen(),
    'card': (BuildContext context) => CardScreen(),
    'animatedContainer': (BuildContext context) => AnimatedContainerScreen(),
    'inputs': (BuildContext context) => InputScreen(),
    'slider': (BuildContext context) => SlideScreen(),
    'list': (BuildContext context) => ListScreen(),
    'gradient': (BuildContext context) => GradientScreen(),
  };
}
