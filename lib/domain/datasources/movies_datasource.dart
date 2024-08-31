import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<Movie> getNowPlaying({int page = 1});
}

