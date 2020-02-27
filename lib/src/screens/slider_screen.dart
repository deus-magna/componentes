import 'package:flutter/material.dart';

class SlideScreen extends StatefulWidget {
  @override
  _SlideScreenState createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearSwitch(),
            _checkBox(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: 'Tamaño de la imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              print(valor);
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      width: _valorSlider,
      fit: BoxFit.contain,
      image: NetworkImage(
          'https://as01.epimg.net/epik/imagenes/2019/09/30/portada/1569845595_102861_1569845680_noticia_normal_recorte1.jpg'),
    );
  }

  // Crea un checkbox
  Widget _checkBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slilder'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: ( valor ){
    //     setState(() {
    //               _bloquearCheck = valor;
    //     });
    //   },
    // );
  }

  _crearSwitch() {

    return SwitchListTile(
      title: Text('Bloquear Slilder'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );

  }
}
