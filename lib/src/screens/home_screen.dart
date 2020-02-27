import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  // Crea una lista
  Widget _lista() {

    // FutureBuilder nos sirve para esperar la carga de datos y cuando estos se terminan de cargar hacer algo
    // future: la funcion que regresa un Future<>
    // initialData: valor por default mientras se traen los datos
    // builder: Aca es donde dependiendo del estado del future podemos hacer diferentes cosas. Debe refresar un Widget
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) {
        
        return ListView(
          children: _listaItems(snapshot.data, context),
        );

      },
    );
  }

  // Tercera forma de cargar items a una lista, usando un forEach
  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach( (opt ) {

      final temp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon'] ),
        trailing:  Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: (){
          // Primera forma de navegacion
          // final route = MaterialPageRoute(
          //   builder: ( context ) => AlertScreen()
          // );

          // Navigator.push(context, route);

          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones..add(temp)..add(Divider());
    });

    return opciones;
  }
}
