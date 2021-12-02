import 'package:cached_network_image/cached_network_image.dart';
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
      leading: CachedNetworkImage(
        height: 50,
        width: 50,
        memCacheHeight: 50,
        memCacheWidth: 50,
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl: imageUrl,
      ),
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
