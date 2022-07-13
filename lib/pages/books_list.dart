import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_books_app/data_controller.dart';

import '../models/books_model.dart';

class BooksList extends StatefulWidget {
  const BooksList({Key? key}) : super(key: key);

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  NewsController newsController = NewsController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Digital Library',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'This is a digital library which contains a number of books especially for medical and diagnostic purposes',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Books For You',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Roboto')),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: FutureBuilder<BooksDTO?>(
                            future: newsController.getBooksData(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.black,
                                ));
                              }
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  snapshot.data != null) {
                                return SingleChildScrollView(
                                  child: Column(
                                    children: snapshot.data!.items!
                                        .map((e) => Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16.0),
                                                        child: Card(
                                                          elevation: 2,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              height: 120,
                                                              imageUrl: e
                                                                  .volumeInfo!
                                                                  .imageLinks!
                                                                  .thumbnail!,
                                                              errorWidget:
                                                                  (x, c, e) {
                                                                try {
                                                                  return Container();
                                                                } catch (e) {
                                                                  return Container();
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              Text(
                                                                  e.volumeInfo!
                                                                      .title!,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                  e.volumeInfo!
                                                                      .publisher!,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              if (e.volumeInfo!
                                                                          .ratingsCount !=
                                                                      0 &&
                                                                  e.volumeInfo!
                                                                          .ratingsCount !=
                                                                      null) ...[
                                                                Row(children: [
                                                                  const Text(
                                                                      'Ratings :',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.w400)),
                                                                  Row(
                                                                    children: [
                                                                      for (int i =
                                                                              0;
                                                                          i < e.volumeInfo!.ratingsCount!;
                                                                          i++)
                                                                        const Icon(
                                                                          Icons
                                                                              .star,
                                                                          color:
                                                                              Colors.yellow,
                                                                          size:
                                                                              12,
                                                                        )
                                                                    ],
                                                                  ),
                                                                ]),
                                                              ],
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Text(
                                                                      'Authors :',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        e.volumeInfo!.authors !=
                                                                                null
                                                                            ? e.volumeInfo!.authors.toString()
                                                                            : 'NA',
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                    ),
                                                                  ]),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                e.saleInfo?.listPrice
                                                                            ?.amount !=
                                                                        null
                                                                    ? 'Price : ${e.saleInfo?.listPrice?.amount} INR'
                                                                    : 'Not For Sale',
                                                                style: TextStyle(
                                                                    color: e.saleInfo?.listPrice?.amount !=
                                                                            null
                                                                        ? Colors
                                                                            .black
                                                                        : Colors
                                                                            .red),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const Divider(
                                                    thickness: 1.5,
                                                  )
                                                ],
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
                              ;
                            }),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
