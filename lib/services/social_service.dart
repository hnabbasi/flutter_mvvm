import 'package:flutter_mvvm/models/Movie.dart';

class SocialService {
  void shareMovie(Movie movie) {
    print("Sharing ${movie.title}");
  }
}