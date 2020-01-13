import 'package:flutter/material.dart';
import 'package:flutter_mvvm/main.dart';
import 'package:flutter_mvvm/models/Movie.dart';
import 'package:flutter_mvvm/services/movie_service.dart';
import 'package:flutter_mvvm/viewmodels/baseViewModel.dart';
import 'package:flutter_mvvm/views/movie_details_page.dart';

class MoviesViewModel extends BaseViewModel {

  final MovieService movieService;

  List<Movie> _movies = List<Movie>();

  List<Movie> get movies => _movies;
  set movies(List<Movie> movies) {
    _movies = movies;
    notifyListeners();
  }

  MoviesViewModel(this.movieService){
    title = "Movies";
  }

  Future<void> searchMovies(String keyword) async {
    final results = await movieService.getMovies(keyword);
    movies = results.map((m) => Movie(title: m.title, poster: m.poster, year: m.year)).toList();
  }
}