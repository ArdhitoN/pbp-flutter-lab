import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart';

import 'package:counter_7/drawer/drawer.dart';


class MyDataPage extends StatefulWidget {
  MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  _MyDataPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form'),
        ),
        drawer: DrawerClass(parentScreen: ScreenName.Data),
        body: Column(children: <Widget>[
          for (int i = 0; i < listJawaban.length; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: const [
                    BoxShadow(color: Colors.black, blurRadius: 2.0)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${listJawaban[i][0]}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("${listJawaban[i][1]}"),
                  Text("${listJawaban[i][2]}")
                ],
              ),
            ),
          // Card(
          //   child: Column(
          //     // Column is also a layout widget. It takes a list of children and
          //     // arranges them vertically. By default, it sizes itself to fit its
          //     // children horizontally, and tries to be as tall as its parent.
          //     //
          //     // Invoke "debug painting" (press "p" in the console, choose the
          //     // "Toggle Debug Paint" action from the Flutter Inspector in Android
          //     // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          //     // to see the wireframe for each widget.
          //     //
          //     // Column has various properties to control how it sizes itself and
          //     // how it positions its children. Here we use mainAxisAlignment to
          //     // center the children vertically; the main axis here is the vertical
          //     // axis because Columns are vertical (the cross axis would be
          //     // horizontal).
          //     mainAxisAlignment: MainAxisAlignment.center,

          //     children: <Widget>[
          //       Text(listJawaban[i][0]),
          //       Text(listJawaban[i][1].toString()),
          //       Text(listJawaban[i][2]),
          //     ],
          //   ),
          // )
        ]));
  }
}

/// An example of the elevated card type.
///
/// The default settings for [Card] will provide an elevated
/// card matching the spec:
///
/// https://m3.material.io/components/cards/specs#a012d40d-7a5c-4b07-8740-491dec79d58b
class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Elevated Card')),
        ),
      ),
    );
  }
}
