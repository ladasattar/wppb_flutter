import 'package:flutter/material.dart';
import 'package:wppb_flutter/model/tourism_place.dart';

class ListItem extends StatelessWidget {
  final TourismPlace place;
  final bool isDone;
  final Function(bool? value) onCheckboxClick;

  // ignore: use_key_in_widget_constructors
  const ListItem({
    required this.place,
    required this.isDone,
    required this.onCheckboxClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDone ? Colors.white60 : Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image(
              image: place.imageAsset != ''
                  ? AssetImage(place.imageAsset) as ImageProvider
                  : NetworkImage(place.imageNetwork),
              fit: BoxFit.cover,
              height: 120,
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(place.name,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF222222))),
                  const SizedBox(height: 10),
                  Text(
                    place.location,
                    style: const TextStyle(
                      fontSize: 13.0,
                      height: 1.3,
                      color: Color(0xFF787878),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Checkbox(value: isDone, onChanged: onCheckboxClick)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
