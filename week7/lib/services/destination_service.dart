import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class DestinationService {
  static const String _baseUrl = 'http://10.0.2.2:8000/api/';

  int? id;
  String? title;
  String? description;
  String? author;
  String? imageUrl;
  XFile? imageFile;

  DestinationService({
    this.id,
    this.title,
    this.description,
    this.author,
    this.imageUrl,
    this.imageFile,
  });

  factory DestinationService.fromJson(Map<String, dynamic> json) =>
      DestinationService(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        author: json["author"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "author": author,
        "imageUrl": imageUrl,
        "imageFile": imageFile,
      };

  Future createDestination(Map<String, String> body, String filepath) async {
    Dio dio = Dio();
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data'
    };

    String name = filepath.split('/').last;

    var data = FormData.fromMap({
      "title": body["title"],
      "description": body["description"],
      "author": body["author"],
      "day_open": body["dayOpen"],
      "time_open": body["timeOpen"],
      "ticket_price": body["ticketPrice"],
      "location": body["location"],
      "imageUrl": await MultipartFile.fromFile(filepath, filename: name),
    });

    await dio
        .postUri(Uri.parse(_baseUrl + "destinations"),
            data: data,
            options: Options(
              followRedirects: false,
            ))
        .then((res) => print(res))
        .catchError((err) => print(err));
  }

  Future updateDestination(
      Map<String, dynamic> body, String destinationId, String? filepath) async {
    Dio dio = Dio();
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data'
    };

    FormData data;

    if (filepath != null) {
      String name = filepath.split('/').last;
      data = FormData.fromMap({
        "title": body['title'],
        "description": body['description'],
        "author": body['author'],
        "day_open": body["day_open"],
        "time_open": body["time_open"],
        "ticket_price": body["ticket_price"],
        "location": body["location"],
        "imageUrl": await MultipartFile.fromFile(filepath, filename: name),
      });
    } else {
      data = FormData.fromMap({
        "title": body['title'],
        "description": body['description'],
        "author": body['author'],
        "day_open": body["day_open"],
        "time_open": body["time_open"],
        "ticket_price": body["ticket_price"],
        "location": body["location"],
        "imageUrl": null,
      });
    }

    await dio
        .postUri(
            Uri.parse(
                _baseUrl + "destinations/" + destinationId + "?_method=PUT"),
            data: data,
            options: Options(
              followRedirects: false,
            ))
        .then((response) => {})
        .catchError((error) => print(error));
  }

  Future<bool> deleteDestination(String destinationId) async {
    final response = await http
        .delete(Uri.parse(_baseUrl + "destinations/" + destinationId));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
