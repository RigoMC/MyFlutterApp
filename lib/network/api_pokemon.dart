import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:primer_proyecto/models/pokemon_model.dart';

class ApiPokemon {
  Future<List<PokemonModel>?> getPokemons() async {
    var result = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));
    var listJson = jsonDecode(result.body)['results'] as List;

    if (result.statusCode == 200) {
      return Future.wait(listJson.map((pokemon) async {
        var pokemonDetailsResult = await http.get(Uri.parse(pokemon['url']));
        var pokemonDetailsJson = jsonDecode(pokemonDetailsResult.body);
        return PokemonModel.fromMap(pokemonDetailsJson);
      }).toList());
    } else {
      return null;
    }
  }
}
