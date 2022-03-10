import 'package:flutter/material.dart';
import 'package:wppb_flutter/detail_screen.dart';
import 'package:wppb_flutter/model/tourism_place.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Bandung'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          final TourismPlace place = tourismPlaceList[index];
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(place: place);
                }));
              },
              child: listItem(place)
          );
        },
        itemCount: tourismPlaceList.length,
      )
    );
  }

  Widget listItem(TourismPlace place){
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Expanded(
            flex: 1,
            child: Image(
              image: place.imageAsset != '' ? AssetImage(place.imageAsset) as ImageProvider : NetworkImage(place.imageNetwork),
              fit: BoxFit.cover,
              height: 120,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget> [
                  Text(
                    place.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF222222)
                    )
                  ),
                  const SizedBox(
                    height: 10
                  ),
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
            )
          )
        ]
      )
    );
  }
}