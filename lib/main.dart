import 'package:flutter/material.dart';
import 'package:flutter_mvvm/providers.dart';
import 'package:flutter_mvvm/services/movie_service.dart';
import 'package:flutter_mvvm/viewmodels/baseViewModel.dart';
import 'package:flutter_mvvm/viewmodels/movieDetailsViewModel.dart';
import 'package:flutter_mvvm/viewmodels/movieViewModel.dart';
import 'package:flutter_mvvm/views/movie_details_page.dart';
import 'package:flutter_mvvm/views/movie_home_page.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
//import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main(){
    _register();
    final Injector injector = Container().initialize();
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<MoviesViewModel>(
            create:(_) => MoviesViewModel(injector.get<MovieService>())
          ),
          ChangeNotifierProvider<MovieDetailsViewModel>(
            create:(_) => MovieDetailsViewModel(movieService: injector.get<MovieService>())
          )
        ],
        child: MyApp(injector: injector)
      )
    );
}

void _register() {
  //Container().initialize();
//
//  container.registerSingleton<MovieService>(MovieService());
//  container.registerSingleton<MoviesViewModel>(MoviesViewModel());
//  container.registerFactory<MoviesViewModel>(()=>MoviesViewModel());
}

class Container {
  Injector initialize([Injector injector]) {
    if(injector == null)
      injector = Injector.getInjector();

    injector.map<MovieService>((i) => MovieService());
    injector.map<MoviesViewModel>((i)=> MoviesViewModel(i.get<MovieService>()));
    injector.map<MovieDetailsViewModel>((i)=> MovieDetailsViewModel(movieService: i.get<MovieService>()));

//    injector.map<String>((i) => "https://api.com/", key: "apiUrl");
//    injector.map<SomeService>(
//            (i) => SomeService(i.get<Logger>(), i.get<String>(key: "apiUrl")));
//
//    injector.map<SomeType>((injector) => SomeType("0"));
//    injector.map<SomeType>((injector) => SomeType("1"), key: "One");
//    injector.map<SomeType>((injector) => SomeType("2"), key: "Two");
//
//    injector.mapWithParams<SomeOtherType>((i, p) => SomeOtherType(p["id"]));

    return injector;
  }
}

class MyApp extends StatelessWidget {
  final Injector injector;
  MyApp({this.injector});

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

