import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final Movie movie = ModalRoute .of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie),
          SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  _PosterAndTitle(movie),
                  _OverViSew(movie),
                  _OverView(movie),
                  _OverView(movie),
                  const SizedBox(height: 20,),
                  CastingCards(movie.id),
                ]
              )
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomAppBar(
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeInImage(
          fit: BoxFit.cover,
          placeholder:const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
        ),
        titlePadding: EdgeInsets.zero,
        centerTitle: true,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: Text(
            movie.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14,),
          ),
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle(
    this.movie,
  );

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding:const  EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              height: 160,
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg)),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 10,),
                Text(
                  movie.originalTitle,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2
                ),
                const SizedBox(height:5,),

                Row(
                  children: [
                    const Icon(
                      Icons.star_border
                    ),
                   const  SizedBox(width: 5,),
                    Text(
                        '${movie.voteAverage}',
                        style: textTheme.caption,

                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  final Movie movie;
  const _OverView(
      this.movie,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Text(
          movie.overview,
          textAlign: TextAlign.justify,

      ),
    );

  }
}

