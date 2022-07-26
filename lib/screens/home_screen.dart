import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Peliculas en Cines'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const  Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
             CardSwiper(movies: moviesProvider.onDisplayMovies,),
             MovieSlider(
               title: 'Populares',
               movies: moviesProvider.popularMovies,
               onNextPage: () => moviesProvider.getPopularMovies(),
             ),

          ],
        ),
      ),
    );
  }
}
