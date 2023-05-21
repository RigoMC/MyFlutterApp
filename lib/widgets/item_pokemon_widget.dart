import 'package:flutter/material.dart';
import 'package:primer_proyecto/models/pokemon_model.dart';
import 'package:primer_proyecto/screens/pokemon_detail_screen.dart';

class ItemPokemonCard extends StatelessWidget {
  const ItemPokemonCard({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
            height: 110.0,
            child: Image.network(
              pokemon.sprites!.frontDefault! ?? 'assets/cover_default.jpg',
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "#" + pokemon.id!.toString() ?? '#',
          style: Theme.of(context).textTheme.labelLarge,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          pokemon.name!.toUpperCase() ?? '¿Quién es este pokemon?',
          style: Theme.of(context).textTheme.labelLarge,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Altura: " + pokemon.height!.toString() + " ft" ?? '',
          style: Theme.of(context).textTheme.bodyLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 10.0,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PokemonDetailScreen(pokemon: pokemon),
            ));
          },
          child: Text('DETALLE'),
        ),
      ]),
    );
  }
}
