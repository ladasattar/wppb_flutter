import 'package:flutter/material.dart';
import 'package:week7/widgets/card_destination.dart';
import 'package:week7/data/api/api_service.dart';
import 'package:week7/data/model/destination.dart';

class DestinationList extends StatefulWidget {
  const DestinationList({Key? key}) : super(key: key);

  @override
  _DestinationListState createState() => _DestinationListState();
}

class _DestinationListState extends State<DestinationList> {
  late Future<Destinations> _article;

  @override
  void initState() {
    super.initState();
    _article = ApiService().topHeadlines();
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder(
      future: _article,
      builder: (context, AsyncSnapshot<Destinations> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            if (snapshot.data!.data.isEmpty) {
              return Center(
                child: Text(
                  'Destinasi belum tersedia',
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.data.length,
                itemBuilder: (context, index) {
                  var destination = snapshot.data?.data[index];
                  return CardDestination(destination: destination!);
                },
              );
            }
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Text('Destinasi belum tersedia');
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinations App'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/createDestination');
          },
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: _buildList(context),
    );
  }
}
