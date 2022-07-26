import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'c517e987f05c52d873863f6591cbbb29';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  Map<int,List<Cast>> movieCast = {};
  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider Inicializado...');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    Uri url = Uri.https(
      _baseUrl,
      endPoint,
      {
        'api_key': _apiKey,
        'language': _language,
        'page': '$page',
      },
    );

    final response = await http.get(url);
    if(response.statusCode != 200) print('error en el servicio, $endPoint');
    return response.body;
  }

  getOnDisplayMovies() async {

    String jsonData = await this._getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {

    _popularPage++;
    final String jsonData = await _getJsonData('3/movie/popular', _popularPage);

    final popularResponse = PopularMoviesResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

  Future <List<Cast>> getMovieCast(int movieId) async{

    if(movieCast.containsKey(movieId)) return movieCast[movieId]!;
    print('SOlicitando servicio - Credits');

    final String jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    movieCast[movieId]= creditsResponse.cast;
    return creditsResponse.cast;

  }
}
