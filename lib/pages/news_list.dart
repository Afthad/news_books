import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_books_app/data_controller.dart';
import 'package:news_books_app/models/news_models.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsController newsController = NewsController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('News Updates',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Roboto')),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder<NewsDTO?>(
                future: newsController.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    const CircularProgressIndicator();
                  }
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: snapshot.data!.articles
                            .map((e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(e.source.name,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(timeago.format(e.publishedAt,
                                                  locale: 'en_short'))
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            e.title,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          if (e.urlToImage != 'NA') ...[
                                            CachedNetworkImage(
                                              imageUrl: e.urlToImage!,
                                              errorWidget: (x, c, e) {
                                                try {
                                                  return Container();
                                                } catch (e) {
                                                  return Container();
                                                }
                                              },
                                            )
                                          ],
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(e.description),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    );
                  }
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  ));
                }),
          ),
        ],
      ),
    );
  }
}
