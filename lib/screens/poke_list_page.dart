import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/http_process.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/screens/poke_detail_page.dart';

class PokemonListPage extends StatefulWidget {
  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  Future<List<Pokemon>> pokeList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var httpHelper = HttpHelper();
    pokeList = httpHelper.getPokeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets\\images\\logo.799db9c7.png"),
        centerTitle: false,
        //backgroundColor: Colors.grey.shade400,
      ),
      body: FutureBuilder(
          future: pokeList,
          builder: (context, AsyncSnapshot<List<Pokemon>> snapshot) {
            if (snapshot.hasData) {
              List<Pokemon> pokelist = snapshot.data;
              return ListView.builder(
                itemCount: pokelist.length,
                itemBuilder: (context, i) => PokeTile(pokelist[i]),
              );
            } else
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.amber,

                semanticsLabel: "Pokemonlar Yükleniyor...",
              ));
          }),
    );
  }

  PokeTile(Pokemon pokemon) {
    return InkWell(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>PokemonDetailPage(pokemon))),
      child: ListTile(
        title: Text(pokemon.name),
        subtitle: Text(pokemon.candy),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(pokemon.img),
          backgroundColor: Colors.indigoAccent.shade400
        ),
      ),
    );
  }
}
