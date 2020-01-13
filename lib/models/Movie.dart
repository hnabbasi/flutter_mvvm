class Movie {
  String title;
  String poster;
  String year;

  Movie({this.title, this.poster, this.year});

  Movie.fromJson(Map<String, dynamic> json){
    this.title = json["Title"];
    this.poster = json["Poster"];
    this.year = json["Year"];
  }
}
