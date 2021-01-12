import 'package:componentes/src/framework/colors.dart';
import 'package:componentes/src/framework/decorations.dart';
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gradientes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: size.width,
              height: size.height / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  stops: [0, 1],
                  colors: [
                    secondary,
                    primary,
                  ],
                  begin: Alignment(_beginX, _beginY),
                  end: Alignment(_endX, _endY),
                ),
              ),
            ),
            Slider(
              label: 'Begin X',
              //divisions: 20,
              value: _beginX,
              onChanged: onChangeBeginX,
            ),
            Slider(
              label: 'Begin Y',
              //divisions: 20,
              value: _beginY,
              onChanged: onChangeBeginY,
            ),
            Slider(
              activeColor: Colors.indigo,
              label: 'Begin Y',
              //divisions: 20,
              value: _endX,
              onChanged: onChangeEndX,
            ),
            Slider(
              activeColor: Colors.indigo,
              label: 'Begin Y',
              //divisions: 20,
              value: _endY,
              onChanged: onChangeEndY,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: cardDecoration,
              child: Column(
                children: [
                  Text('Stops'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        onPressed: () => print('Add Stops'),
                        color: Colors.blue,
                        shape: StadiumBorder(),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      Text('2'),
                      RaisedButton(
                        onPressed: () => print('Add Stops'),
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
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: cardDecoration,
              child: Column(
                children: [
                  Text('Colors'),
                  ColorSelector(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onChangeBeginX(double value) => setState(() => _beginX = value);
  onChangeBeginY(double value) => setState(() => _beginY = value);
  onChangeEndX(double value) => setState(() => _endX = value);
  onChangeEndY(double value) => setState(() => _endY = value);
}

class ColorSelector extends StatelessWidget {
  final Function onRedColorChange;
  final Function onGreenColorChange;
  final Function onBlueColorChange;
  final double redValue;
  final double greenValue;
  final double blueValue;

  const ColorSelector(
      {Key key,
      this.onRedColorChange,
      this.onGreenColorChange,
      this.onBlueColorChange,
      this.redValue,
      this.greenValue,
      this.blueValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Color # 1'),
          Text('RED'),
          Slider(
            activeColor: Colors.red,
            label: 'Begin Y',
            min: 0,
            max: 255,
            value: redValue,
            onChanged: onRedColorChange,
          ),
          Text('GREEN'),
          Slider(
            activeColor: Colors.green,
            label: 'Begin Y',
            min: 0,
            max: 255,
            value: greenValue,
            onChanged: onGreenColorChange,
          ),
          Text('BLUE'),
          Slider(
            activeColor: Colors.blue,
            label: 'Begin Y',
            min: 0,
            max: 255,
            value: blueValue,
            onChanged: onBlueColorChange,
          ),
        ],
      ),
    );
  }
}
