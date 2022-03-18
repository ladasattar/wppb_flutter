import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wppb_flutter/model/tourism_place.dart';
import 'package:wppb_flutter/provider/done_tourism_provider.dart';

class DoneTourismList extends StatelessWidget {
  const DoneTourismList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TourismPlace> doneTourismPlaceList =
        Provider.of<DoneTourismProvider>(
      context,
      listen: false,
    ).doneTourismPlaceList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Telah Dikunjungi'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = doneTourismPlaceList[index];
          return Card(
            color: Colors.white60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                const Icon(Icons.done_outline),
              ],
            ),
          );
        },
        itemCount: doneTourismPlaceList.length,
      ),
    );
  }
}
