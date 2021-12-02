import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:person_finder/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Person Finder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'The Person Finder',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'If you just can’t find someone and need to know what they look like, you’ve come to the right place! Just type the name of the person you are looking for below into the search box!',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: CupertinoSearchTextField(
                  placeholder: 'Search in Air HQ',
                ),
              ),
              ListView.builder(
                // itemCount: testData.length,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) => card(
                    context,
                    testData[index]['name'].toString(),
                    testData[index]['avatar'].toString(),
                    testData[index]['description'].toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget card(
    BuildContext context, String name, String imageUrl, String description) {
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
