import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:peliculas/domain/entities/movie.dart';

import '../widgets/shared/custom_movie_card.dart';

class FavoritesBody extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? callBack;

  FavoritesBody({super.key, required this.movies, this.callBack});

  @override
  State<FavoritesBody> createState() => _FavoritesBodyState();
}

class _FavoritesBodyState extends State<FavoritesBody> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels + 100 >=
          controller.position.maxScrollExtent) {
        widget.callBack!();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 3,
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: CustomMovieCard(
            movie: widget.movies[index],
          ),
          onTap: () => context.push('/home/0/movie/${widget.movies[index].id}'),
        );
      },
    );
  }
}
