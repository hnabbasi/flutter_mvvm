import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/Movie.dart';
import 'package:flutter_mvvm/viewmodels/movieDetailsViewModel.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

//class MovieDetailsPage extends StatefulWidget {
//
//  @override
//  State<StatefulWidget> createState() => _MovieDetailsPageState();
//}
//
//class _MovieDetailsPageState extends State<MovieDetailsPage> {
//
//  @override
//  Widget build(BuildContext context) {
//    final vm = Provider.of<MovieDetailsViewModel>(context);
//    vm.movie = Movie(title: "hello", poster: "na");
//    TextStyle titleStyle = GoogleFonts.prociono(fontSize: 40);
//    TextStyle detailStyle = GoogleFonts.roboto(fontSize: 20);
//
//    return Scaffold(
//        appBar: AppBar(
//            title: Text(vm.title),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.share),
//              onPressed: ()=>{
//                vm.share()
//              },
//            )
//          ],
//        ),
//        body: Container(
//            padding: EdgeInsets.all(10),
//            width: MediaQuery.of(context).size.width,
//            height: MediaQuery.of(context).size.height,
//            child: Column(children: <Widget>[
//              Expanded(
//                child: Container(
//                margin: EdgeInsets.all(10),
//                padding: EdgeInsets.all(10),
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(8),
//                    image: DecorationImage(
//                        image: NetworkImage(vm.movie.poster),
//                        fit: BoxFit.cover
//                    )
//                ),
//              ),
//              ),
//              Expanded(
//                  child: ListView(
//                    children: <Widget>[
//                      Text(
//                          vm.movie.title,
//                          style: titleStyle
//                      ),
//                      Text(
//                        "Release date: October 18, 2019",
//                        style: detailStyle,
//                      )
//                    ],
//                  )
//              )
//              ]
//            )
//        )
//    );
//  }
//
//}

class MovieDetailsPage extends StatelessWidget {
  final Movie _movie;

  MovieDetailsPage(this._movie);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieDetailsViewModel>(context);
    vm.movie = _movie;
    TextStyle titleStyle = GoogleFonts.prociono(fontSize: 40);
    TextStyle detailStyle = GoogleFonts.roboto(fontSize: 20);

    return Scaffold(
        appBar: AppBar(
            title: Text(vm.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
                onPressed: () => {
                  vm.share()
                },
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Expanded(
                child: Container(
//                  margin: EdgeInsets.all(10),
//                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(vm.movie.poster),
                          fit: BoxFit.scaleDown
                      )
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                    children: <Widget>[
                      Text(
                          vm.movie.title,
                          style: titleStyle
                      ),
                      Text(
                        "Release in ${vm.movie.year}",
                        style: detailStyle,
                      )
                    ],
                  )
              )
            ]
            )
        )
    );
  }
}