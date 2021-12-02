import 'package:flutter/material.dart';
import 'package:person_finder/data.dart';

import '../person_card.dart';

class PersonSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      if (query.isEmpty)
        IconButton(
          tooltip: 'Search in Air HQ',
          icon: const Icon(Icons.search),
          onPressed: () {},
        )
      else
        IconButton(
          tooltip: 'Clear',
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    final list = testData
        .where((element) => element['name'].toString().contains(query))
        .toList();
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => PersonCard(
        name: list[index]['name'].toString(),
        imageUrl: list[index]['avatar'].toString(),
        description: list[index]['description'].toString(),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = testData
        .where((element) => element['name'].toString().contains(query))
        .toList();
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => PersonCard(
        name: list[index]['name'].toString(),
        imageUrl: list[index]['avatar'].toString(),
        description: list[index]['description'].toString(),
      ),
    );
  }
}
