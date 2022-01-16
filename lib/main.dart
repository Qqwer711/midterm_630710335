import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pig weight calculator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final _lengthController = TextEditingController();
  final _girthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('PIG WEIGHT',
                      style: TextStyle(
                          fontSize: 65,
                          fontWeight: FontWeight.normal,
                          color: Colors.pinkAccent)),
                  const Text('CALCULATOR',
                      style: TextStyle(
                          fontSize: 65,
                          fontWeight: FontWeight.normal,
                          color: Colors.pinkAccent)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                'assets/images/pig.png',
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const Text('LENGTH',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.blueAccent)),
                            const Text('(cm)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.blueAccent)),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18, bottom: 12),
                              child: TextField(
                                  controller: _lengthController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter length',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          children: [
                            const Text('GIRTH',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.blueAccent)),
                            const Text('(cm)',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.blueAccent)),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18, bottom: 12),
                              child: TextField(
                                  controller: _girthController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter girth',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(


              padding: const EdgeInsets.all(18),


              child: ElevatedButton(

                  onPressed: () {
                    var length_text = _lengthController.text;
                    var girth_text = _girthController.text;
                    double? length = double.tryParse(length_text);
                    double? girth = double.tryParse(girth_text);

                    if (length == null || girth == null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("ERROR PLEASE TRY AGAIN"),
                            content: const Text(
                                "Invalid input"),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      double weight =
                          (girth / 100) * (girth / 100) * (length / 100) * 69.3;
                      double price = weight * 112.50;
                      double approx_weight = 0.03 * weight;
                      double approx_price = 0.03 * price;

                      //double weightMax = (0.03 * weight)+weight;
                      //double PriceMax = (0.03 * price)+price;
                      double weightMin = weight - (0.03 * weight);
                      double PriceMin = price - (0.03 * price);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Row(
                            children:[  Image.asset('assets/images/ic_pig.png',width:50 ,height:50),
                                        Text('    RESULT'),
           ],
                            ),
                            content: Text(
                                'Weight: ${weightMin.round()} - ${approx_weight.round()} kg\nPrice: ${PriceMin.round()} - ${approx_price.round()} Baht'),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child:
                      Text('CALCULATE', style: TextStyle(color: Colors.black))),


            ),
          ],
        ),
      ),
    );
  }
}
