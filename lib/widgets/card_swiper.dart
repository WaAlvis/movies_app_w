import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({
    Key? key,
    required this.movies
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if(this.movies.length == 0) {
      return SizedBox(
          width: double.infinity,
          height: size.height*0.55,
          child: const Center(
              child: CircularProgressIndicator()
          ),
      );
    }


      return  SizedBox(
        width: double.infinity,
        height: size.height * 0.6,
        child: Swiper(
          itemCount: movies.length,
          itemHeight: size.height*0.55,
          itemWidth: size.width*0.8,
          layout: SwiperLayout.STACK,
          itemBuilder: (_, int index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(_, 'details', arguments: movie),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                ),
              ),
            );
          },
        ),
      );
    }
  }

