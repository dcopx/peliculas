import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peliculas/presentation/screens/widgets/shared/custom_movie_card.dart';

import '../../../domain/entities/movie.dart';

class MoviesListWiew extends StatefulWidget {
  final String? title;
  final String? dateTitle;
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MoviesListWiew(
      {super.key,
      this.title,
      this.dateTitle,
      required this.movies,
      this.loadNextPage});

  @override
  State<MoviesListWiew> createState() => _MoviesListWiewState();
}

class _MoviesListWiewState extends State<MoviesListWiew> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                if (widget.title != null) Text(widget.title!, style: textStyle),
                const Spacer(),
                if (widget.dateTitle != null)
                  FilledButton.tonal(
                      onPressed: () {}, child: Text(widget.dateTitle!)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (context, index) => GestureDetector(
                child: CustomMovieCard(movie: widget.movies[index]),
                onTap: () {
                  context.push('/home/0/movie/${widget.movies[index].id}');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
