import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const myApp());
}

var counter = 0;

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(99, 78, 9, 124),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                show_toast("menu");
              },
            ),
            title: const Text("Home Page"),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  show_toast("camera");
                },
              )
            ],
          ),
          body: const HomeClass(),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
void show_toast(var type) {
  Fluttertoast.showToast(
    msg: type,
  );

  //const HomeClass();
  //myHomePageState(counter.toString());
}

class HomeClass extends StatefulWidget {
  const HomeClass({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomeClass> createState() => myHomePageState();
}

// ignore: camel_case_types
class myHomePageState extends State<HomeClass> {
  int a = 0;
  void increaseFunc() {
    setState(() {
      a++;
    });
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Center(
                    child: TextButton(
                        onPressed: () {
                          show_toast("Its a Text");
                        },
                        child: Text(
                          "message " + a.toString() + " times",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.white,
                          child: TextButton(
                              onPressed: () {
                                // show_toast(Text().data);
                              },
                              child: const Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FloatingActionButton(
            onPressed: increaseFunc,
            tooltip: 'Increment',
            child: const Icon(
              Icons.message,
              color: Color.fromARGB(98, 255, 255, 255),
            ),
            backgroundColor: const Color.fromARGB(99, 78, 9, 124),
          ),
        ));
  }
}
