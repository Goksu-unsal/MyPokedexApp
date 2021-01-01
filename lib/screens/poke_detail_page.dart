import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  Pokemon _pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(_pokemon.img),),
            SizedBox(width: 15,),
            Text(_pokemon.name)
          ],
        ),
        //backgroundColor: Colors.grey.shade400,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/2,
                child: Center(
                    child: CircleAvatar(
              backgroundImage: NetworkImage(_pokemon.img),radius: MediaQuery.of(context).size.width/6 ,
            ))),
          ],
        ),
      ),
    );
  }

  PokemonDetailPage(this._pokemon);
}
