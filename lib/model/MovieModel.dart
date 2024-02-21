// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieModel {
  String MovieTitle;
  String MovieOverView;
  bool isAdult;
  String MovieBackDropPath;
  double MoviePopularity;
  String MoviePosterPath;
  String MovieReleaseDate;
  double MovieRating;
  int MovieId;

  MovieModel({
    required this.MovieTitle,
    required this.MovieOverView,
    required this.isAdult,
    required this.MovieBackDropPath,
    required this.MoviePopularity,
    required this.MoviePosterPath,
    required this.MovieReleaseDate,
    required this.MovieRating,
    required this.MovieId,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
        MovieTitle: map['original_title'],
        MovieOverView: map['overview'],
        isAdult: map['adult'],
        MovieBackDropPath: map['backdrop_path'],
        MoviePopularity: map['popularity'],
        MoviePosterPath: map['poster_path'],
        MovieReleaseDate: map['release_date'],
        MovieRating: map['vote_average'],
        MovieId: map['id']);
  }
  Map<String, dynamic> toMap() {
    return {
      'MovieTitle': MovieTitle,
      'MovieOverView': MovieOverView,
      'isAdult': isAdult,
      'MovieBackDropPath': MovieBackDropPath,
      'MoviePopularity': MoviePopularity,
      'MoviePosterPath': MoviePosterPath,
      'MovieReleaseDate': MovieReleaseDate,
      'MovieRating': MovieRating,
      'MovieId': MovieId,
    };
  }
}
