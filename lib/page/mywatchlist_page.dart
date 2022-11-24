import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:counter_7/model/mywatchlist.dart';

import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/form.dart';

import 'package:counter_7/main.dart';

import 'dart:convert';

import 'package:counter_7/fetcher/fetcherWatchList.dart';

import 'package:counter_7/drawer/drawer.dart';

import 'package:counter_7/page/mywatchlist_detail.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({Key? key}) : super(key: key);

  @override
  _MyWatchListState createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: DrawerClass(parentScreen: ScreenName.MyWatchList),
        body: FutureBuilder(
            future: fetcherMyWatchList().fetchMyWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada watch list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => ListTile(
                            title: Text("${snapshot.data![index].title}"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyWatchListDetail(
                                      watchList: snapshot.data![index]),
                                ),
                              );
                            },
                          ));
                }
              }
            }));
  }
}
