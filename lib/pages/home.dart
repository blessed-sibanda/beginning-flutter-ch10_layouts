import 'dart:ui';

import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        brightness: Brightness.light,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.cloud_queue)),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildJournalHeaderImage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildJournalEntry(),
                  const Divider(),
                  _buildJournalWeather(),
                  const Divider(),
                  _buildJournalTags(),
                  const Divider(),
                  _buildJournalFooterImages(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildJournalHeaderImage() {
    return const Image(
      image: AssetImage('assets/images/present.jpg'),
      fit: BoxFit.cover,
    );
  }

  Widget _buildJournalEntry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'My Birthday',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        Text(
          "It's going to be a great birthday. We are going out for dinner at my favorite place, then watch a movie after we go to the gelateria for ice cream and espresso.",
          style: TextStyle(color: Colors.black54),
        )
      ],
    );
  }

  Widget _buildJournalWeather() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.wb_sunny, color: Colors.orange),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '81 Clear',
              style: TextStyle(color: Colors.deepOrange),
            ),
            Text(
              '4500 San Alpho Drive, Dallas, TX United States',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildJournalTags() {
    return Wrap(
      spacing: 8.0,
      children: List.generate(
        7,
        (index) {
          return Chip(
            label: Text(
              'Gift ${index + 1}',
              style: const TextStyle(fontSize: 10.0),
            ),
            avatar: Icon(Icons.card_giftcard, color: Colors.blue.shade300),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: const BorderSide(color: Colors.grey),
            ),
            backgroundColor: Colors.grey.shade100,
          );
        },
      ),
    );
  }

  Widget _buildJournalFooterImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/salmon.jpg'),
          radius: 40.0,
        ),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/asparagus.jpg'),
          radius: 40.0,
        ),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/strawberries.jpg'),
          radius: 40.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Icon(Icons.cake),
            Icon(Icons.star_border),
            Icon(Icons.music_note),
            // Icon(Icons.movie),
          ],
        ),
      ],
    );
  }
}
