import 'package:flutter_mvvm/models/Movie.dart';
import 'package:flutter_mvvm/services/social_service.dart';
import 'package:flutter_mvvm/viewmodels/baseViewModel.dart';

class MovieDetailsViewModel extends BaseViewModel {
  Movie _movie;
  SocialService _socialService;

  MovieDetailsViewModel(this._socialService){
    title = "Details";
  }

  Movie get movie => _movie;

  set movie(Movie movie) {
    _movie = movie;
//    notifyListeners();
  }
  
  void share(){
    _socialService.shareMovie(movie);
  }
}