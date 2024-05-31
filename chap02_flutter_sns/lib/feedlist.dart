import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedList extends StatefulWidget {
  const FeedList({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  //좋아요 여부
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(widget.imageUrl,
            height: 400, width: double.infinity, fit: BoxFit.cover),
        Row(
          children: [
            IconButton(
              icon: Icon(
                CupertinoIcons.heart,
                color: isFavorite ? Colors.red : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.chat_bubble,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                CupertinoIcons.bookmark,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "3 likes",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        //피드 글작성
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("네온과 고양이, 최고의 조합 😎 \n#CatLife #NeonVibes"),
        ),

        //날짜
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "May 29",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
