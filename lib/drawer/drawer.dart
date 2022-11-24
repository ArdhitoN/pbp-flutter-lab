import 'package:flutter/material.dart';

import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/mywatchlist_page.dart';

import 'package:counter_7/main.dart';


//source:   https://stackoverflow.com/questions/66925164/refactoring-dart-code-into-a-separate-file
enum ScreenName {
  Home,
  Data,
  Form,
  MyWatchList,
  MyWatchList_Detail,
}

class DrawerClass extends StatefulWidget {
  final ScreenName parentScreen;

  const DrawerClass({required this.parentScreen});

  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage(title: 'Flutter Demo Home Page')),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah budget'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),

          ListTile(
            title: const Text('Data budget'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyDataPage()),
              );
            },
          ),

          ListTile(
            title: const Text('My Watch List'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyWatchListPage()),
              );
            },
          ),

        ],
      ),
    );
  }
}
