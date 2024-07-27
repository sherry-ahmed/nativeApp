import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:native_app/screens/add_place_screen.dart';
import 'package:native_app/providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
            ),
          ],
        ),
        body: Consumer<GreatPlaces>(
          child: const Center(
            child: Text('Got no places yet, start adding some!'),
          ),
          builder: (ctx, greatPlaces, ch) {
            if (greatPlaces.items.isEmpty) {
              return ch!;
            } else {
              return ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatPlaces.items[i].image,
                    ),
                  ),
                  title: Text(greatPlaces.items[i].title),
                  onTap: () {
                    // Go to detail page ...
                  },
                ),
              );
            }
          },
        ));
  }
}
