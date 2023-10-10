import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietest/features/home/peresintaion/manager/home_cubit/home_states.dart';
import 'package:movietest/features/home/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

class HomeCubit extends Cubit<HomePageStates> {
  HomeCubit() : super(HomePageLoading());
  List<MovieModel> model = [];
  getPopularMovies() async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=3bde688d09fec315b1bc2ce62084a282&language=en-US');

    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        MovieResult results = MovieResult.fromJson(responsebody);

        List<MovieModel> playingmovieslist = results.playingmovieresults
            .map((e) => MovieModel.fromJson(e))
            .toList();
        model = playingmovieslist;
        emit(GetDataSucess());
        return playingmovieslist;
      } else {
        emit(GetDataFailed());
        throw (response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  List<MovieModel> ucomingMovies = [];

  getUpComingmoviedata() async {
    
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=3bde688d09fec315b1bc2ce62084a282&language=en-US&page=1');
    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        MovieResult results = MovieResult.fromJson(responsebody);
        List<MovieModel> playingmovieslist = results.playingmovieresults
            .map((e) => MovieModel.fromJson(e))
            .toList();
        ucomingMovies = playingmovieslist;
        emit(GetUpComingMoviesSucess());
        return playingmovieslist;
      } else {
        emit(GetUpComingMoviesSFailed());
        throw (response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }

  List<MovieModel> topmovies = [];

  getplayingmoviedata() async {

    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=3bde688d09fec315b1bc2ce62084a282&language=en-US&page=1');
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        MovieResult results = MovieResult.fromJson(responsebody);
        List<MovieModel> listofmovie = results.playingmovieresults
            .map((e) => MovieModel.fromJson(e))
            .toList();
        topmovies = listofmovie;
        emit(GetTopMoviesSucess());
        return listofmovie;
      } else {
        emit(GetTopMoviesSFailed());

        throw (response.statusCode);
      }
    } catch (e) {
      throw ('d');
    }
  }

  List<VideoModel> video = [];
  Future<List<VideoModel>> fetchtopratedmoviesapi(id) async {
    try {
      var url = Uri.parse(
          'https://api.themoviedb.org/3/movie/$id/videos?api_key=3bde688d09fec315b1bc2ce62084a282&language=en-US');
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        MovieVideoResult results = MovieVideoResult.fromJson(responsebody);
        video = results.movievideoresults
            .map((e) => VideoModel.fromJson(e))
            .toList();
        emit(GetVideoSucess());
        return video;
      } else {
        emit(GetVideoSFailed());

        throw (response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}
