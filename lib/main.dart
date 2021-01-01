import 'package:flutter/material.dart';
import 'package:pokedex_app/screens/poke_list_page.dart';

void main() {
  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokedex App",
      theme: ThemeData(
        primaryColor: Colors.grey.shade600
      ),
      home: PokemonListPage(),
    );
  }

}

