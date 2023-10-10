class MovieResult {
  List<dynamic> playingmovieresults;
  MovieResult({
    required this.playingmovieresults,
  });
  factory MovieResult.fromJson(Map<String, dynamic> json) {
    return MovieResult(playingmovieresults: json['results']);
  }
}

class MovieVideoResult {
  List<dynamic> movievideoresults;
  MovieVideoResult({
    required this.movievideoresults,
  });
  factory MovieVideoResult.fromJson(Map<String, dynamic> json) {
    return MovieVideoResult(movievideoresults: json['results']);
  }
}

class MovieModel {
  late bool adult;
  late String title;
  late String data;
  late String overview;
  late var vote;
  late var id;
  late String image;
  MovieModel({
    required this.adult,
    required this.title,
    required this.data,
    required this.overview,
    required this.vote,
    required this.id,
    required this.image,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      adult: json['adult'],
      title: json['original_title'],
      vote: json['vote_average'],
      image: json['poster_path'],
      overview: json['overview'],
      data: json['release_date'],
    );
  }
}

class TvModel {
  late String title;
  late String data;
  late String overview;
  late var vote;
  late var id;
  late String image;
  TvModel({
    required this.title,
    required this.data,
    required this.overview,
    required this.vote,
    required this.id,
    required this.image,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      id: json['id'],
      title: json['name'],
      vote: json['vote_average'],
      image: json['poster_path'],
      overview: json['overview'],
      data: json['first_air_date'],
    );
  }
}

class VideoModel {
  final String key;
  VideoModel({
    required this.key,
  });
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(key: json['key']);
  }
}