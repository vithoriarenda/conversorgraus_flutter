import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'transforma.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: "Conversor de temperatura",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController txtTemperatura_gc = TextEditingController();
  TextEditingController txtTemperatura_gf = TextEditingController();

  TransformaCF t = TransformaCF();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Celsius p/ Fahrenheit"),
        centerTitle: true,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          const Text(
            "Graus Celsius",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
          ),
          TextField(
            controller: txtTemperatura_gc,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Digite o valor dos graus"),
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.w200,
              fontFamily: "Roboto",
            ),
          ),
          const Text(
            "Graus Fahrenheit",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
          ),
          TextField(
            controller: txtTemperatura_gf,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Digite o valor dos graus"),
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.w200,
              fontFamily: "Roboto",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    double graus;
                    if (txtTemperatura_gc.text.isEmpty)
                      txtTemperatura_gc.text = "0.0";
                    graus = double.parse(txtTemperatura_gc.text);
                    t.gc = graus;
                    txtTemperatura_gf.text = t.cf().toString();
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  });
                },
                child: const Text(
                  " C/F ",
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    double graus;
                    if (txtTemperatura_gf.text.isEmpty)
                      txtTemperatura_gf.text = "0.0";
                    graus = double.parse(txtTemperatura_gf.text);
                    t.gf = graus;
                    txtTemperatura_gc.text = t.cf().toString();
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  });
                },
                child: const Text(
                  " F/C ",
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    //txtTemperatura_gc.clear();
                    txtTemperatura_gc.text = "0.0";
                    txtTemperatura_gf.text = "0.0";
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  });
                },
                child: const Text(
                  "NOVO",
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
