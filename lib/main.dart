import 'package:flutter/material.dart';
import 'package:flutter_mvvm/services/movie_service.dart';
import 'package:flutter_mvvm/services/social_service.dart';
import 'package:flutter_mvvm/viewmodels/movieDetailsViewModel.dart';
import 'package:flutter_mvvm/viewmodels/movieViewModel.dart';
import 'package:flutter_mvvm/views/movie_home_page.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:provider/provider.dart';

void main(){

    final Injector injector = Container().initialize();
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<MoviesViewModel>(
            create:(_) => injector.get<MoviesViewModel>()
          ),
          ChangeNotifierProvider<MovieDetailsViewModel>(
            create:(_) => injector.get<MovieDetailsViewModel>()
          )
        ],
        child: MyApp()
      )
    );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieHomePage()
    );
  }
}

class Container {
  Injector initialize([Injector injector]) {
    if(injector == null)
      injector = Injector.getInjector();

    injector.map<String>((i) => "http://www.omdbapi.com/", key: "apiUrl");
    injector.map<MovieService>((i) => MovieService(apiUrl: i.get<String>(key: "apiUrl")));
    injector.map<SocialService>((i) => SocialService());
    injector.map<MoviesViewModel>((i)=> MoviesViewModel(i.get<MovieService>()));
    injector.map<MovieDetailsViewModel>((i)=> MovieDetailsViewModel(i.get<SocialService>()));
    return injector;
  }
}


