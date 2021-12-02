import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String description;

  const PersonCard(
      {required this.name,
      required this.imageUrl,
      required this.description,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imageUrl),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      subtitle: Text(description),
    );
  }
}
