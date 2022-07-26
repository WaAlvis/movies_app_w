
import 'dart:convert';

class Movie {
  Movie({
    required  this.adult,
    this.backdropPath,
    required  this.genreIds,
    required  this.id,
    required  this.originalLanguage,
    required  this.originalTitle,
    required  this.overview,
    required  this.popularity,
    this.posterPath,
    this.releaseDate,
    required  this.title,
    required  this.video,
    required  this.voteAverage,
    required  this.voteCount,
  });

  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String? releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  String get fullPosterImg {
    return  posterPath != null
        ? 'https://image.tmdb.org/t/p/w500/${ this.posterPath }'
        :'https://i.pinimg.com/originals/0c/32/97/0c3297f3516a415219c7e89e16a4a3d2.jpg';
  }

  String get fullBackdropPath {
    return  posterPath != null
        ? 'https://image.tmdb.org/t/p/w500/${ this.backdropPath }'
        :'https://i.pinimg.com/originals/0c/32/97/0c3297f3516a415219c7e89e16a4a3d2.jpg';
  }

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    releaseDate: json["release_date"],
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );
}
