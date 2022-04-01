import 'dart:convert';

Destinations destinationsFromJson(String str) =>
    Destinations.fromJson(json.decode(str));

String destinationsToJson(Destinations data) => json.encode(data.toJson());

class Destinations {
  Destinations({
    required this.data,
  });

  List<Destination> data;

  factory Destinations.fromJson(Map<String, dynamic> json) => Destinations(
        data: List<Destination>.from(
            json["data"].map((x) => Destination.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Destination {
  Destination({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.dayOpen,
    required this.timeOpen,
    required this.ticketPrice,
    required this.location,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String description;
  String author;
  String dayOpen;
  String timeOpen;
  String ticketPrice;
  String location;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        author: json["author"],
        dayOpen: json["day_open"],
        timeOpen: json["time_open"],
        ticketPrice: json["ticket_price"],
        location: json["location"],
        imageUrl: json["imageUrl"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "author": author,
        "dayOpen": dayOpen,
        "timeOpen": timeOpen,
        "ticketPrice": ticketPrice,
        "location": location,
        "imageUrl": imageUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
