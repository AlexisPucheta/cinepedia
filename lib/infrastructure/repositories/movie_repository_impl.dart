import 'package:cinepedia/domain/datasources/movie_datasource.dart';
import 'package:cinepedia/domain/entities/movie.dart';
import 'package:cinepedia/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
