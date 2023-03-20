import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String calBmi(double a, double b) {
  double height = (a / 100) * (a / 100);
  double weight = b;
  String bmi = (weight / height).toString();
  return bmi;
}

String output(String a, String b) {
  try {
    double height = double.parse(a);
    double weight = double.parse(b);
    String res = calBmi(height, weight);
    return res;
  } catch (e) {
    return e.toString();
  }
}

var primarycolor = Colors.purple;
var bmi = "0";
final weight = TextEditingController();
final height = TextEditingController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        title: 'BMI Calculator',
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
                    child: Text(bmi.toString()),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.01),
                    child: TextField(
                      // controller: weight,
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
                      bmi = output(height.text, weight.text);
                      print(bmi);
                    },
                    child: const Text("Calculate BMI"),
                  ),
                ]),
          ),
        ));
  }
}
