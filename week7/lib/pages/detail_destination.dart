import 'package:flutter/material.dart';
import 'package:week7/data/model/destination.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:week7/services/destination_service.dart';

class DetailDestination extends StatelessWidget {
  const DetailDestination({Key? key}) : super(key: key);
  final baseUrlImage = "http://10.0.2.2:8000/storage/";

  @override
  Widget build(BuildContext context) {
    final destination =
        ModalRoute.of(context)!.settings.arguments as Destination;

    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_arrow,
        children: [
          SpeedDialChild(
            onTap: () {
              _showChoiceDialog(context, destination.id.toString());
            },
            child: const Icon(Icons.delete, color: Colors.white),
            label: "Hapus Destinasi",
            backgroundColor: Colors.red,
          ),
          SpeedDialChild(
            onTap: () => {
              Navigator.pushNamed(
                context,
                '/updateDestination',
                arguments: destination,
              ),
            },
            child: const Icon(Icons.edit, color: Colors.white),
            label: "Perbarui Destinasi",
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 400,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: ClipRRect(
                      child:
                          Image.asset('assets/images/dummy-image-square.jpg'),
                      // child: Image.network(baseUrlImage + destination.imageUrl),
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  destination.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87),
                ),
                margin: const EdgeInsets.only(top: 16.0),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.calendar_today_outlined),
                        Text(
                          destination.dayOpen,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, height: 1.5),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.access_time),
                        Text(
                          destination.timeOpen,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, height: 1.5),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.attach_money),
                        Text(
                          'Rp' + destination.ticketPrice,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, height: 1.5),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Lokasi",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black87),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    margin: const EdgeInsets.only(top: 8, bottom: 16),
                    child: Text(
                      destination.location,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                          height: 1.3),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Deskripsi",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black87),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(
                      destination.description,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                          height: 1.3),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showChoiceDialog(BuildContext context, String id) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Anda yakin menghapus destinasi?",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      DestinationService().deleteDestination(id);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Destinasi berhasil dihapus')));
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const Text(
                      'Ya, Hapus',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black87),
                    ),
                    child: const Text(
                      'Tidak, Batal',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // Widget imageGallery(Destination destination) {
  //   return ListView(
  //     padding: const EdgeInsets.only(left: 16, bottom: 16),
  //     scrollDirection: Axis.horizontal,
  //     children: destination.gallery
  //         .map(
  //           (item) => Padding(
  //             padding: const EdgeInsets.all(4.0),
  //             child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(10),
  //                 child: Image.network(item)),
  //           ),
  //         )
  //         .toList(),
  //   );
  // }
}
