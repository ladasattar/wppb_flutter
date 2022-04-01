import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:week7/data/model/destination.dart';
import 'package:week7/services/destination_service.dart';

class UpdateDestination extends StatefulWidget {
  const UpdateDestination({Key? key}) : super(key: key);

  @override
  State<UpdateDestination> createState() => _UpdateDestinationState();
}

class _UpdateDestinationState extends State<UpdateDestination> {
  XFile? imageFile;
  // Destination? destination;
  DestinationService destinationService = DestinationService();
  String? title;
  String? description;
  String? author;
  String? dayOpen;
  String? timeOpen;
  String? ticketPrice;
  String? location;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final destination =
        ModalRoute.of(context)!.settings.arguments as Destination;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Perbarui Destinasi"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          initialValue: destination.title,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Nama Destinasi',
                          ),
                          onChanged: (text) {
                            // ignore: avoid_print
                            setState(() {
                              title = text;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          initialValue: destination.dayOpen,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Hari Buka',
                          ),
                          onChanged: (text) {
                            // ignore: avoid_print
                            setState(() {
                              dayOpen = text;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          initialValue: destination.timeOpen,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Jam Buka',
                          ),
                          onChanged: (text) {
                            // ignore: avoid_print
                            setState(() {
                              timeOpen = text;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          initialValue: destination.ticketPrice,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Harga Tiket',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            // ignore: avoid_print
                            setState(() {
                              ticketPrice = text;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          initialValue: destination.location,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Lokasi',
                          ),
                          onChanged: (text) {
                            // ignore: avoid_print
                            setState(() {
                              location = text;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          initialValue: destination.description,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Deskripsi',
                          ),
                          onChanged: (text) {
                            // ignore: avoid_print
                            setState(() {
                              description = text;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          initialValue: destination.author,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Author',
                          ),
                          onChanged: (text) {
                            // ignore: avoid_print
                            setState(() {
                              author = text;
                            });
                          },
                        ),
                      ),
                      InkWell(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          width: MediaQuery.of(context).size.width * 1,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFCFCFCF), width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Click to Change Image',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                color: Color(0xFFBDBDBD),
                                height: 1,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () {
                          _showChoiceDialog(context);
                        },
                      ),
                      imageFile == null
                          ? Image.asset("assets/images/dummy-image-square.jpg")
                          : Image.file(File(imageFile!.path)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    _formKey.currentState!.save();
                    Map<String, String> body = {
                      'title': title!,
                      'description': description!,
                      'author': author!,
                      'day_open': dayOpen!,
                      'time_open': timeOpen!,
                      'ticket_price': ticketPrice!,
                      'location': location!,
                    };

                    // print(title);
                    // print(dayOpen);
                    // print(description);
                    // print(timeOpen);
                    // print(author);
                    // print(location);
                    // print(ticketPrice);

                    imageFile != null
                        ? await destinationService
                            .updateDestination(body, destination.id.toString(),
                                imageFile!.path)
                            .then((value) {
                            // print(value);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Destinasi berhasil diperbarui')));
                            Navigator.pushReplacementNamed(context, '/');
                          })
                        : await destinationService
                            .updateDestination(
                                body, destination.id.toString(), null)
                            .then((value) {
                            // print(value);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Destinasi berhasil diperbarui')));
                            Navigator.pushReplacementNamed(context, '/');
                          });
                  },
                  child: const Text("Perbarui Destinasi"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Divider(height: 1, color: Colors.blue),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: const Text("Gallery"),
                    leading: const Icon(Icons.account_box, color: Colors.blue),
                  ),
                  const Divider(height: 1, color: Colors.blue),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: const Text("Camera"),
                    leading: const Icon(Icons.camera, color: Colors.blue),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _openCamera(BuildContext context) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = pickedFile;
    });
    Navigator.pop(context);
  }

  void _openGallery(BuildContext context) async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = pickedFile;
    });
    Navigator.pop(context);
  }
}
