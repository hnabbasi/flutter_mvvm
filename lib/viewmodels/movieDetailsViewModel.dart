import 'package:flutter_mvvm/models/Movie.dart';
import 'package:flutter_mvvm/services/movie_service.dart';
import 'package:flutter_mvvm/viewmodels/baseViewModel.dart';

class MovieDetailsViewModel extends BaseViewModel {
  Movie _movie;
  MovieService movieService;

  MovieDetailsViewModel({this.movieService}){
    title = "Details";
  }

  Movie get movie => _movie;

  set movie(Movie movie) {
    _movie = movie;
//    notifyListeners();
  }
  
  void share(){
    print("Sharing ${_movie.title}");
  }
}