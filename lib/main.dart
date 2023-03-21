import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

String calBmi(double a, double b) {
  double height = (a / 100) * (a / 100);
  double weight = b;
  String bmi = (weight / height).toStringAsFixed(2);
  return bmi;
}

String output(String a, String b) {
  try {
    double height = double.parse(a);
    double weight = double.parse(b);
    String res = calBmi(height, weight);
    // print(weight.runtimeType);
    return res;
  } catch (e) {
    // print(e);
    return e.toString();
  }
}

var primarycolor = Colors.purple;
var bmi = "0";
String bmiT = "";
final weight = TextEditingController();
final height = TextEditingController();
Color contColor = Colors.amberAccent;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SpaceTonic',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.amberAccent,
          primarySwatch: primarycolor,
        ),
        home: Scaffold(
          body: Container(
            margin: EdgeInsets.all(size.height * 0.025),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.01),
                    child: Text(
                      "BMI Calculator",
                      style: TextStyle(fontSize: size.height * 0.1),
                    ),
                  ),
                  Container(
                    // color: contColor,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: contColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(size.height * 0.01),
                      child: Column(
                        children: [
                          Text(bmi.toString(),
                              style: TextStyle(fontSize: size.height * 0.1)),
                          Text(bmiT,
                              style: TextStyle(fontSize: size.height * 0.06)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.01),
                    child: TextField(
                      controller: weight,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Weight',
                          suffix: const Text("Kgs"),
                          prefixIcon: const Icon(Icons.monitor_weight_outlined),
                          hoverColor: Colors.white,
                          suffixIcon: IconButton(
                            onPressed: () {
                              weight.clear();
                            },
                            icon: const Icon(Icons.clear),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.01),
                    child: TextField(
                      controller: height,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Height',
                          suffix: const Text("cm"),
                          prefixIcon: const Icon(Icons.moving_outlined),
                          hoverColor: Colors.white,
                          suffixIcon: IconButton(
                            onPressed: () {
                              height.clear();
                            },
                            icon: const Icon(Icons.clear),
                          )),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        bmi = output(height.text, weight.text);
                        if (double.parse(bmi) < 18) {
                          contColor = const Color.fromARGB(255, 129, 129, 129);
                          bmiT = "Underweight";
                        } else if (double.parse(bmi) > 18 &&
                            double.parse(bmi) < 25) {
                          bmiT = "Normal";
                          contColor = Colors.greenAccent;
                        } else if (double.parse(bmi) > 25 &&
                            double.parse(bmi) < 31) {
                          bmiT = "Overweight";
                          contColor = Colors.orange;
                        } else {
                          contColor = Colors.red;
                          bmiT = "Obese";
                        }

                        height.clear();
                        weight.clear();
                      });
                    },
                    child: const Text("Calculate BMI"),
                  ),
                ]),
          ),
        ));
  }
}
