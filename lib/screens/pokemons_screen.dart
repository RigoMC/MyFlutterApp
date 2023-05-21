import 'package:flutter/material.dart';
import 'package:primer_proyecto/models/pokemon_model.dart';
import 'package:primer_proyecto/network/api_pokemon.dart';
import 'package:primer_proyecto/widgets/item_pokemon_widget.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "POKEMONS",
        style: Theme.of(context).textTheme.titleLarge,
      )),
      body: FutureBuilder<List<PokemonModel>?>(
        future: ApiPokemon().getPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error al obtener los Pokemons'),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final pokemon = snapshot.data![index];
                return Container(
                  key: UniqueKey(),
                  padding: EdgeInsets.all(10.0),
                  child: ItemPokemonCard(pokemon: pokemon),
                );
              },
            );
          } else {
            return Center(
              child: Text('No se encontraron pokemons'),
            );
          }
        },
      ),
    );
  }
}
