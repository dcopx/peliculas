import 'package:flutter/material.dart';

class CustomGradient extends StatelessWidget {
  final Alignment begin;
  final Alignment end;
  final List<double> stops;
  final List<Color> colors;

  const CustomGradient(
      {super.key,
      required this.begin,
      required this.end,
      required this.stops,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              stops: stops, begin: begin, end: end, colors: colors),
        ),
      ),
    );
  }
}
