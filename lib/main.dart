import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WPPB Flutter',
      theme: ThemeData(fontFamily: "Inter"),
      home: const DetailScreen(),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                ),
                child: Image.asset("assets/img/submarine-1.jpg"),
              ),
              Container(
                child: const Text(
                  "Surabaya Submarine Monument",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87
                  ),
                ),
                margin: const EdgeInsets.only(top: 16.0),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        Icon(Icons.calendar_today_outlined),
                        Text(
                          'Everyday',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            height: 1.5
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.access_time),
                        Text(
                          '08:00-16:00',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            height: 1.5
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.attach_money),
                        Text(
                          'Rp15.000',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            height: 1.5
                          ),
                        )
                      ],
                    ),
                  ],
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
                      fontWeight: FontWeight.w600,
                        color: Colors.black87
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                margin: const EdgeInsets.only(top: 8),
                child: const Text(
                  "Surabaya Submarine Monument or as known as Monumen Kapal Selam (Monkasel) is the largest submarine monument in Asia, which was built in riverside of Kalimas, Surabaya. This monument was built by idea of Navy Veterans.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    height: 1.3
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Foto lainnya",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87
                    ),
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 8, top: 20),
              ),
              SizedBox(
                height: 166,
                child: ListView(
                  padding: const EdgeInsets.only(left: 16, bottom: 16),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network("https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg")
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/img/monkasel-1.jpg")
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/img/monkasel-2.jpg")
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/img/monkasel-3.jpg")
                      )
                    ),
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}