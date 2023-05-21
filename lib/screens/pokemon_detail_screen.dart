import 'package:flutter/material.dart';
import 'package:primer_proyecto/models/pokemon_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon!.name!.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 25.0,
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(1),
                      bottomRight: Radius.circular(1)),
                  image: DecorationImage(
                      image: AssetImage('assets/fondo.jpg'),
                      fit: BoxFit.cover,
                      opacity: 0.8)),
              child: SizedBox(
                height: 250.0,
                child: Image.network(
                  pokemon.sprites!.frontDefault!,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "#" + pokemon.id!.toString() + " " + pokemon.name!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            offset: Offset(1.5, 1.5))
                      ]),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Altura: " + pokemon.height!.toString() + " ft" ?? "",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Peso: " + pokemon.weight!.toString() + " kg",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
