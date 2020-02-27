import 'package:flutter/material.dart';

class HomeScreenTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(children: _crearItemsCorta()),
    );
  }

  // Forma numero 1 de cargar datos en una lista
  List<Widget> _crearItems() {
    List<Widget> lista = List<Widget>();
    for (var opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      // Operador en cascada
      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }

  // Forma numero 2 de cargar datos en una lista
  List<Widget> _crearItemsCorta() {
    // Se utiliza un map, map hace que una lista, cree una nueva lista
    // pero cada objeto pasa por una funcion que puede realizar cambios en los objetos
    // map regresa un iterable, es por eso que debemos usar .toList para hacer la lista
    var widgets = opciones.map((item) {
      // Objeto que se crea por cada iteracion.
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Subtitle'),
            leading: Icon(Icons.access_alarms),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();

    // Aca regresamos la lista
    return widgets;
  }

  // Forma numero 2 de cargar datos en una lista
  List<Widget> _crearItemsCorta2() {
    // Se utiliza un map, map hace que una lista, cree una nueva lista
    // pero cada objeto pasa por una funcion que puede realizar cambios en los objetos
    // map regresa un iterable, es por eso que debemos usar .toList para hacer la lista
    return opciones.map((item) {
      // Objeto que se crea por cada iteracion.
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Subtitle'),
            leading: Icon(Icons.access_alarms),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
