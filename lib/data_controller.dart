import 'package:dio/dio.dart';
import 'package:news_books_app/models/books_model.dart';
import 'package:news_books_app/models/news_models.dart';

class NewsController {
  late Response response;
  var dio = Dio();
  Future<NewsDTO?> getData() async {
    var data = await dio.get(
        'https://newsapi.org/v2/everything?q=bitcoin&from=2022-06-12&sortBy=publishedAt&apiKey=52938cdda79b4a478d6d8022f13a3579');

    if (data.data != null) {
      return NewsDTO.fromJson(data.data);
    }
    return null;
  }

  Future<BooksDTO?> getBooksData() async {
    var data =
        await dio.get('https://www.googleapis.com/books/v1/volumes?q=cancer');

    if (data.data != null) {
      return BooksDTO.fromJson(data.data);
    }
    return null;
  }
}
