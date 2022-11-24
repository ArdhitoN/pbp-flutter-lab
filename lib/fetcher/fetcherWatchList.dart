import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:counter_7/main.dart';

import 'package:counter_7/page/mywatchlist_page.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/form.dart';

import 'package:counter_7/model/mywatchlist.dart';

class fetcherMyWatchList {
  fetcherMyWatchList();

  Future<List<MyWatchList>> fetchMyWatchList() async {
    var url = Uri.parse(
        'http://cata-log.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object MyWatchList
    List<MyWatchList> listMyWatchList = [];
    for (var d in data) {
      if (d != null) {
        listMyWatchList.add(MyWatchList.fromJson(d));
      }
    }

    return listMyWatchList;
  }
}