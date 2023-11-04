import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scarelapp/model/model.dart';
import 'package:url_launcher/url_launcher.dart';


class GetUser extends ChangeNotifier{

List<User> users = [];
Future<void> fetchUser() async {
  try {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      users = jsonList.map((jsonMap) => User.fromJson(jsonMap)).toList();
      notifyListeners();
    } else {
      // More detailed error information for non-200 responses
      throw Exception('Failed to load data. Status Code: ${response.statusCode}');
    }
  } catch (error) {
    // Handle other errors like network issues, timeouts, etc.
    throw Exception('Failed to load data: $error');
  }
}

 void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}



