import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TelaInicial();
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  TextEditingController etanolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();
  String resultado = "";

  void _calcularMelhorOpcao() {
    double etanolPrice = double.tryParse(etanolController.text) ?? 0;
    double gasolinaPrice = double.tryParse(gasolinaController.text) ?? 0;

    double ratio = etanolPrice / gasolinaPrice;

    setState(() {
      if (ratio < 0.7) {
        resultado = "Abasteça com etanol";
      } else {
        resultado = "Abasteça com gasolina";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Álcool ou Gasolina"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _foto(),
          SizedBox(height: 10),
          _campo(etanolController, "Preço do Etanol"),
          SizedBox(height: 10),
          _campo(gasolinaController, "Preço da Gasolina"),
          SizedBox(height: 30),
          _button(),
          SizedBox(height: 20),
          _resultado(),
        ],
      ),
    );
  }

  _foto() {
    return Center(
      child: Image.network(
        'https://mega98fm.com.br/portal/wp-content/uploads/2018/05/combustiveis.jpg',
        height: 200,
        width: 200,
      ),
    );
  }

  _campo(TextEditingController controller, String labelText) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: controller,
    );
  }

  _resultado() {
    return Text(
      resultado,
      style: TextStyle(color: Colors.red, fontSize: 25),
    );
  }

  _button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
      ),
      onPressed: _calcularMelhorOpcao,
      child: Text(
        "Verificar",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}
