import 'package:flutter_mvvm/main.dart';
import 'package:flutter_mvvm/services/movie_service.dart';
import 'package:flutter_mvvm/viewmodels/movieDetailsViewModel.dart';
import 'package:flutter_mvvm/viewmodels/movieViewModel.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:provider/provider.dart';

class MyProviders extends MultiProvider {

//  final Injector injector;

//  MyProviders(this.injector) {
//    providers.add(Provider<MoviesViewModel>(
//        create:(_) => MoviesViewModel()
//    ));
//    providers.add(Provider<MovieDetailsViewModel>(
//        create:(_) => MovieDetailsViewModel(movieService: injector.get<MovieService>())
//    ));
//  }
}