/*
  existing packages
    - material
  constants file
    - news_list
*/
import 'package:flutter/material.dart';
import '../constants/news_list.dart';

class Newspage extends StatelessWidget {
  Newspage({super.key});

  // get settings
  final NewsList newsList = NewsList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            // header
            const NewsTitle(),
            // news list
            News(newsList: newsList),
          ],
        ),
      ),
    );
  }
}

/*
  News widgets
  Function: display the news in the list
  Last updated: 15 Apr 2023
*/
class News extends StatelessWidget {
  const News({
    super.key,
    required this.newsList,
  });

  final NewsList newsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      child: Image.asset(
                        newsList.newsImage[index],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 8.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newsList.newsTitle[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis, // n
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            newsList.newsDescription[index],
                            style: TextStyle(
                              color: Colors.grey[350],
                              fontSize: 18.0,
                            ),
                            softWrap: false,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis, // n
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Last updated: ${newsList.publishedDateTime[index]}',
                            style: TextStyle(
                              color: Colors.grey[350],
                              fontWeight: FontWeight.w100,
                              fontSize: 11.0,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/*
  NewsTitle widget
  Function: Title of Page
  Gesture Detector: navigate news page back to home page
  Last updated: 14 Apr 2023
*/
class NewsTitle extends StatelessWidget {
  const NewsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.grey[50],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Latest News",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.grey[350],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
