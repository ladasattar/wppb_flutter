import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:week7/services/destination_service.dart';

class CreateDestination extends StatefulWidget {
  const CreateDestination({Key? key}) : super(key: key);

  @override
  State<CreateDestination> createState() => _CreateDestinationState();
}

class _CreateDestinationState extends State<CreateDestination> {
  XFile? imageFile;
  // Destination? destination;
  DestinationService destination = DestinationService();
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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Destinations App"),
        ),
        body: formCreateDestination(context));
  }

  Widget formCreateDestination(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
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
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
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
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
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
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
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
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
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
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
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
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
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
                    margin: const EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFCFCFCF), width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: (imageFile != null)
                        ? Image.file(File(imageFile!.path))
                        : const Center(
                            child: Text(
                              'Click to Add Image',
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
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                _formKey.currentState!.save();
                Map<String, String> body = {
                  'title': title!,
                  'description': description!,
                  'author': author!,
                  'dayOpen': dayOpen!,
                  'timeOpen': timeOpen!,
                  'ticketPrice': ticketPrice!,
                  'location': location!,
                };
                await destination
                    .createDestination(body, imageFile!.path)
                    .then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Destinasi berhasil ditambahkan')));
                  Navigator.pushReplacementNamed(context, '/');
                });
              },
              child: const Text("Tambah Destinasi"),
            ),
          ],
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
