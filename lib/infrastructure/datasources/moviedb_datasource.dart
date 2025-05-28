import 'package:cinepedia/config/constants/environment.dart';
import 'package:cinepedia/domain/datasources/movie_datasource.dart';
import 'package:cinepedia/domain/entities/movie.dart';
import 'package:cinepedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinepedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource implements MovieDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );

    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies =
        movieDBResponse.results
            .where((movieDB) => movieDB.posterPath != 'NO-POSTER')
            .map((movieDB) => MovieMapper.movieDBToEntity(movieDB))
            .toList();
    return movies;
  }
}
