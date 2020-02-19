import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/viewmodels/movieViewModel.dart';
import 'package:provider/provider.dart';

import 'widgets/movie_list.dart';

class MovieHomePage extends StatefulWidget {
  MovieHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MovieHomePageState createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {

  final TextEditingController _controller = TextEditingController();

  @override Widget build(BuildContext context) {
    print(">>> ${this.toStringShort()} called");
    final moviesViewModel = Provider.of<MoviesViewModel>(context);

    return Scaffold(
        appBar: AppBar(
            title: Text(moviesViewModel.title)
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1,1),
                          blurRadius: 1.0
                      )
                    ]
                ),
                child: TextField(
                  controller: _controller,
                  onChanged: (value) {
                    if(value.length < 2)
                      return;
                    moviesViewModel.searchMovies(value);
                  },
                  onSubmitted: (value) {
                    if(value.isNotEmpty) {
                      moviesViewModel.searchMovies(value);
                      _controller.clear();
                    } else {
                      reset();
                    }
                  },
                  style: TextStyle(color: Colors.blueGrey, fontSize: 18),
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      border: InputBorder.none,
                      suffix: IconButton(
                        color: Colors.blueGrey,
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          _controller.clear();
                          reset();
                        },
                      )
                  ),
                ),
              ),
              Expanded(
                  child: MovieList(moviesViewModel.movies)
              )
          ]
            )
        )
    );
  }

  @override
  void initState() {
    super.initState();
    reset();
  }

  void reset() {
    _controller.clear();
    Provider.of<MoviesViewModel>(context, listen: false).searchMovies("harry potter");
  }
}