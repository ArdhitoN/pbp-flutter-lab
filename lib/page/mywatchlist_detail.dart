import 'package:flutter/material.dart';

import 'package:counter_7/page/mywatchlist_page.dart';

import 'package:counter_7/model/mywatchlist.dart';

import 'package:counter_7/main.dart';

import 'package:counter_7/drawer/drawer.dart';

class MyWatchListDetail extends StatelessWidget {
  // In the constructor, require a Todo.
  const MyWatchListDetail({super.key, required this.watchList});

  // Declare a field that holds the Todo.
  final MyWatchList watchList;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(watchList.title + " Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              "${watchList.title}",
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            )),
            const SizedBox(height: 30),
            Text(
              "Release Date: ${watchList.release_date}",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Rating: " + watchList.rating + "/5",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Status: " + (watchList.is_watched ? "watched" : "not watched"),
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Review: \n" + watchList.review,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            ListTile(
                title: const Text('Kembali'),
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
