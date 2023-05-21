import 'package:flutter/material.dart';
import 'package:primer_proyecto/models/movie_model.dart';

class ItemPopular extends StatelessWidget {
  const ItemPopular({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fit: BoxFit.fill,
      placeholder: const AssetImage('assets/loading.gif'),
      image: NetworkImage(
          'https://image.tmdb.org/t/p/w500/${movieModel.posterPath}'),
    );
  }
}
