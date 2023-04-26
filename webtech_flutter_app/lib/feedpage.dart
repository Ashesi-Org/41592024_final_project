import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<FeedItem> _feedItems = [
    FeedItem(
      author: 'Jude Jovan',
      content: 'Lebron James is the greatest NBA player of all time',
      likes: 5,
      comments: 2,
    ),
    FeedItem(
      author: 'Tina Bern',
      content: 'Have a lot of lectures this week',
      likes: 10,
      comments: 3,
    ),
    FeedItem(
      author: 'Kofi Asante',
      content: 'Who can help me with flutter :(',
      likes: 8,
      comments: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Feed'),
      ),
      body: ListView.builder(
        itemCount: _feedItems.length,
        itemBuilder: (BuildContext context, int index) {
          return FeedCard(feedItem: _feedItems[index]);
        },
      ),
    );
  }
}

class FeedItem {
  final String author;
  final String content;
  final int likes;
  final int comments;

  FeedItem({
    required this.author,
    required this.content,
    required this.likes,
    required this.comments,
  });
}

class FeedCard extends StatelessWidget {
  final FeedItem feedItem;

  FeedCard({required this.feedItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(feedItem.author),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(feedItem.content),
          ),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
              ),
              Text(feedItem.likes.toString()),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {},
              ),
              Text(feedItem.comments.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
