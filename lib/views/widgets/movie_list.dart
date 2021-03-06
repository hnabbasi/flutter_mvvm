import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/Movie.dart';
import 'package:flutter_mvvm/views/movie_details_page.dart';

class MovieList extends StatelessWidget {

  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    print(">>> ${this.toStringShort()} called");
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(this.movies.length, (index) {
        return GestureDetector(
          onTap: ()=> {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsPage(this.movies[index])
              )
            )
          },
          child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(this.movies[index].poster),
                  fit: BoxFit.cover
              )
            ),
          )
        );
      }),
    );
  }
}