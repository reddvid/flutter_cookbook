import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_data/models/pizza.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> myPizzas = [];
  var formatCurrency = NumberFormat.currency(locale: 'en_PH', symbol: '₱');
  int appCounter = 0;
  String documentsPath = '';
  String tempPath = '';
  late File myFile;
  String fileText = '';

  @override
  void initState() {
    super.initState();

    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });

    readAndWritePreference();
    getPaths().then((_) {
      myFile = File('$documentsPath/pizzas.txt');
      writeFile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You have opened the app $appCounter times.'),
        actions: [
          IconButton(
            onPressed: () {
              deletePreference();
            },
            tooltip: 'Reset counter',
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('Doc path: $documentsPath'),
          Text('Temp path: $tempPath'),
          ElevatedButton(
            onPressed: () => readFile(),
            child: const Text('Read File'),
          ),
          Text(fileText),
          // Flexible(
          //   child: ListView.builder(
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Text(myPizzas[index].pizzaName),
          //         subtitle: Text(
          //           '${myPizzas[index].description} - ${formatCurrency.format(myPizzas[index].price)}',
          //         ),
          //       );
          //     },
          //     itemCount: myPizzas.length,
          //   ),
          // ),
        ],
      ),
    );
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist.json');

    List pizzaMapList = jsonDecode(myString);

    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }

    String json = convertToJson(myPizzas);
    print(json);

    return myPizzas;
  }

  String convertToJson(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  }

  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;

    await prefs.setInt('appCounter', appCounter);

    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
