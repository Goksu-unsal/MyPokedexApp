import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokedex_app/models/pokemon.dart';

class HttpHelper{
  Future<List<Pokemon>> getPokeList() async {
    var response = await http.get(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    String responseBody = response.body.toString();
    List<Pokemon> pokeList = (json.decode(responseBody)["pokemon"] as List)
        .map((e) => Pokemon.fromJson(e))
        .toList();
    return pokeList;
  }
}