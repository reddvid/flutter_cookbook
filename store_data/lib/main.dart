import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:store_data/main_reading.dart';
import 'package:store_data/models/httphelper.dart';
import 'package:store_data/models/pizza.dart';
import 'package:store_data/pizza_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
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
  final pwdController = TextEditingController();
  String myPass = '';
  final storage = const FlutterSecureStorage();
  final myKey = 'myPass';
  var formatCurrency = NumberFormat.currency(locale: 'en_PH', symbol: '₱');

  @override
  void initState() {
    super.initState();
  }

  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future<String> readFromSecureStorage() async {
    String secret = await storage.read(key: myKey) ?? '';
    return secret;
  }

  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    List<Pizza> pizzas = await helper.getPizzaList();
    return pizzas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON')),
      body: FutureBuilder(
        future: callPizzas(),
        builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: (snapshot.data == null) ? 0 : snapshot.data!.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title: Text(snapshot.data![position].pizzaName),
                subtitle: Text(
                  '${snapshot.data![position].description} ${formatCurrency.format(snapshot.data![position].price)}',
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PizzaDetailScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: const Text('Path Provider')),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         children: [
    //           TextField(controller: pwdController),
    //           ElevatedButton(
    //             onPressed: () {
    //               writeToSecureStorage();
    //             },
    //             child: const Text('Save Value'),
    //           ),
    //           ElevatedButton(
    //             onPressed: () {
    //               readFromSecureStorage().then((value) {
    //                 setState(() {
    //                   myPass = value;
    //                 });
    //               });
    //             },
    //             child: const Text('Read Value'),
    //           ),
    //           Text(myPass),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
