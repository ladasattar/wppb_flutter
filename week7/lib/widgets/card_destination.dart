import 'package:flutter/material.dart';
import 'package:week7/data/model/destination.dart';

class CardDestination extends StatelessWidget {
  final Destination destination;

  // ignore: use_key_in_widget_constructors
  const CardDestination({required this.destination});
  final baseUrlImage = "http://10.0.2.2:8000/storage/";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Hero(
          tag: destination.imageUrl,
          child: Image.asset('assets/images/dummy-image-square.jpg'),
          // child: Image.network(baseUrlImage + destination.imageUrl),
        ),
        title: Text(destination.title),
        subtitle: Text(destination.location),
        onTap: () => Navigator.pushNamed(
          context,
          '/detailDestination',
          arguments: destination,
        ),
      ),
    );
  }
}
