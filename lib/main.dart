import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:person_finder/data.dart';
import 'package:person_finder/person_card.dart';

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
                itemBuilder: (context, index) => PersonCard(
                  name: testData[index]['name'].toString(),
                  imageUrl: testData[index]['avatar'].toString(),
                  description: testData[index]['description'].toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
