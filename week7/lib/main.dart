import 'package:flutter/material.dart';
import 'package:week7/pages/create_destination.dart';
import 'package:week7/pages/destination_list.dart';
import 'package:week7/pages/detail_destination.dart';
import 'package:week7/pages/update_destination.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vacations App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const DestinationList(),
        "/createDestination": (context) => const CreateDestination(),
        "/detailDestination": (context) => const DetailDestination(),
        "/updateDestination": (context) => const UpdateDestination(),
      },
    );
  }
}
