import 'package:componentes/src/framework/decorations.dart';
import 'package:componentes/src/models/gradient_color.dart';
import 'package:flutter/material.dart';

class GradientScreen extends StatefulWidget {
  @override
  _GradientScreenState createState() => _GradientScreenState();
}

class _GradientScreenState extends State<GradientScreen> {
  double _beginX = 0.0;
  double _beginY = 0.0;
  double _endX = 1.0;
  double _endY = 1.0;
  List<GradientColor> colors;

  @override
  void initState() {
    colors = List<GradientColor>();
    colors.add(GradientColor(252, 0, 0, 0));
    colors.add(GradientColor(252, 252, 0, 1));
    print('El color ${colors[0].color}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<int> _numeros = List(6);
    _numeros[0] = 1;
    _numeros[1] = 2;
    _numeros[2] = 3;
    _numeros[3] = 4;
    _numeros[4] = 5;

    // int _valor = 1;
    // if (_numeros.contains(_valor)) {
    //   _numeros.remove(_valor);

    // }

    final size = MediaQuery.of(context).size;
    final stops = colors.map((gradientColor) => gradientColor.stop).toList();
    final colorsList =
        colors.map((gradientColor) => gradientColor.color).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Gradientes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: size.width / 2,
              height: size.width / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  stops: stops,
                  colors: colorsList,
                  // transform: GradientRotation(3.1415 / 2),
                  begin: Alignment(_beginX, _beginY),
                  end: Alignment(_endX, _endY),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: cardDecoration,
              child: Column(
                children: [
                  Text('Begin'),
                  Slider(
                    label: 'Begin X',
                    min: -1,
                    value: _beginX,
                    onChanged: onChangeBeginX,
                  ),
                  Slider(
                    label: 'Begin Y',
                    min: -1,
                    value: _beginY,
                    onChanged: onChangeBeginY,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: cardDecoration,
              child: Column(
                children: [
                  Text('End'),
                  Slider(
                    activeColor: Colors.indigo,
                    label: 'Begin Y',
                    min: -1,
                    value: _endX,
                    onChanged: onChangeEndX,
                  ),
                  Slider(
                    activeColor: Colors.indigo,
                    label: 'Begin Y',
                    min: -1,
                    value: _endY,
                    onChanged: onChangeEndY,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: cardDecoration,
              child: _buildNumberOfColorsControl(),
            ),
            _buildColorsList(),
          ],
        ),
      ),
    );
  }

  ListView _buildColorsList() {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: cardDecoration,
            child: Column(
              children: [
                ColorSelector(
                  color: colors[index],
                  onRedColorChange: (value) {
                    setState(() {
                      colors[index].setRed(value.toInt());
                      print('El color: ${colors[0].red}');
                    });
                  },
                  onBlueColorChange: (value) {
                    setState(() {
                      colors[index].setBlue(value.toInt());
                      print('El color: ${colors[0].red}');
                    });
                  },
                  onGreenColorChange: (value) {
                    setState(() {
                      colors[index].setGreen(value.toInt());
                      print('El color: ${colors[0].red}');
                    });
                  },
                  onChangeStop: (value) {
                    setState(() {
                      colors[index].setStop(value);
                    });
                  },
                ),
              ],
            ),
          );
        });
  }

  Column _buildNumberOfColorsControl() {
    return Column(
      children: [
        Text('Colors'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: () =>
                  setState(() => colors.add(GradientColor(255, 0, 0, 0.5))),
              color: Colors.blue,
              shape: StadiumBorder(),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            Text(colors.length.toString()),
            RaisedButton(
              onPressed: () => setState(() => colors.removeLast()),
              color: Colors.blue,
              shape: StadiumBorder(),
              child: Icon(
                Icons.exposure_minus_1,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  onChangeBeginX(double value) => setState(() => _beginX = value);
  onChangeBeginY(double value) => setState(() => _beginY = value);
  onChangeEndX(double value) => setState(() => _endX = value);
  onChangeEndY(double value) => setState(() => _endY = value);
}

class ColorSelector extends StatefulWidget {
  final Function(double) onRedColorChange;
  final Function(double) onGreenColorChange;
  final Function(double) onBlueColorChange;
  final Function(double) onChangeStop;
  final GradientColor color;

  const ColorSelector({
    Key key,
    @required this.onRedColorChange,
    this.onGreenColorChange,
    @required this.onBlueColorChange,
    @required this.color,
    this.onChangeStop,
  }) : super(key: key);

  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('STOP: ${widget.color.stop.toStringAsFixed(2)}'),
          Slider(
            activeColor: Colors.black,
            label: 'Stop',
            value: widget.color.stop,
            onChanged: widget.onChangeStop,
            min: 0,
            max: 1,
          ),
          Text('RED: ${widget.color.red}'),
          Slider(
            activeColor: Colors.red,
            label: 'Begin Y',
            min: 0,
            max: 255,
            value: widget.color.red.toDouble(),
            onChanged: widget.onRedColorChange,
          ),
          Text('GREEN: ${widget.color.green}'),
          Slider(
            activeColor: Colors.green,
            label: 'Begin Y',
            min: 0,
            max: 255,
            value: widget.color.green.toDouble(),
            onChanged: widget.onGreenColorChange,
          ),
          Text('BLUE: ${widget.color.blue}'),
          Slider(
            activeColor: Colors.blue,
            label: 'Begin Y',
            min: 0,
            max: 255,
            value: widget.color.blue.toDouble(),
            onChanged: widget.onBlueColorChange,
          ),
        ],
      ),
    );
  }
}
