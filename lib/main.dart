// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, non_constant_identifier_names, deprecated_member_use
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  var displaytxt = 20;
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return RaisedButton(
      onPressed: () {
        calcular(btntxt);
      },
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 40,
          color: txtcolor,
        ),
      ),
      shape: CircleBorder(),
      color: btncolor,
      padding: EdgeInsets.all(20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculadora'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 120,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('DEL', Colors.white, Colors.black),
                calcbutton('/', Colors.blue, Colors.black),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', Colors.white, Colors.black),
                calcbutton('8', Colors.white, Colors.black),
                calcbutton('9', Colors.white, Colors.black),
                calcbutton('x', Colors.blue, Colors.black),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', Colors.white, Colors.black),
                calcbutton('5', Colors.white, Colors.black),
                calcbutton('6', Colors.white, Colors.black),
                calcbutton('-', Colors.blue, Colors.black),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Colors.white, Colors.black),
                calcbutton('2', Colors.white, Colors.black),
                calcbutton('3', Colors.white, Colors.black),
                calcbutton('+', Colors.blue, Colors.black),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(30, 20, 80, 20),
                  onPressed: () {
                    calcular('0');
                  },
                  shape: StadiumBorder(),
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  color: Colors.grey,
                ),
                calcbutton('.', Colors.white, Colors.black),
                calcbutton('=', Colors.blue, Colors.black),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  var text = '0';
  double num1 = 0;
  double num2 = 0;

  var resultado = '';
  var resultadoFin = '';
  var operacion = '';
  var preOpr = '';

  void calcular(btnText) {
    if (btnText == 'DEL') {
      text = '0';
      num1 = 0;
      num2 = 0;
      resultado = '';
      resultadoFin = '0';
      operacion = '';
      preOpr = '';
    } else if (operacion == '=' && btnText == '=') {
      if (preOpr == '+') {
        resultadoFin = add();
      } else if (preOpr == '-') {
        resultadoFin = sub();
      } else if (preOpr == 'x') {
        resultadoFin = mul();
      } else if (preOpr == '/') {
        resultadoFin = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (num1 == 0) {
        num1 = double.parse(resultado);
      } else {
        num2 = double.parse(resultado);
      }

      if (operacion == '+') {
        resultadoFin = add();
      } else if (operacion == '-') {
        resultadoFin = sub();
      } else if (operacion == 'x') {
        resultadoFin = mul();
      } else if (operacion == '/') {
        resultadoFin = div();
      }
      preOpr = operacion;
      operacion = btnText;
      resultado = '';
    } else if (btnText == '.') {
      if (!resultado.toString().contains('.')) {
        resultado = resultado.toString() + '.';
      }
      resultadoFin = resultado;
    } else {
      resultado = resultado + btnText;
      resultadoFin = resultado;
    }

    setState(() {
      text = resultadoFin;
    });
  }

  String add() {
    resultado = (num1 + num2).toString();
    num1 = double.parse(resultado);
    return Decimal(resultado);
  }

  String sub() {
    resultado = (num1 - num2).toString();
    num1 = double.parse(resultado);
    return Decimal(resultado);
  }

  String mul() {
    resultado = (num1 * num2).toString();
    num1 = double.parse(resultado);
    return Decimal(resultado);
  }

  String div() {
    resultado = (num1 / num2).toString();
    num1 = double.parse(resultado);
    return Decimal(resultado);
  }

  String Decimal(var resultado) {
    if (resultado.toString().contains('.')) {
      List<String> splitDecimal = resultado.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return resultado = splitDecimal[0].toString();
    }
    return resultado;
  }
}