import 'package:flutter/material.dart';
import 'package:wt_pokemon/providers/pokemon_provider.dart';

import 'package:wt_pokemon/widgets.dart';

class PokemonListView extends StatefulWidget {
  final Pokedex pokedex;
  final String title;

  PokemonListView(this.pokedex, {required Key key, required this.title})
      : super(key: key);

  @override
  _PokemonListViewState createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  late Pokemon pokemon;

  fetchPokemon(pokemon, index) {
    pokemon = widget.pokedex.pokemonList[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd71010),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(
          // future: DefaultAssetBundle.of(context).loadString('assets/pokedex.json'),
          builder: (context) {
        // if(snapshot.connectionState == ConnectionState.done) {
        // final List<Pokemon> pokemon = snapshot.data;

        return Container(
          padding: const EdgeInsets.only(
              top: 10, bottom: 10, left: 15.0, right: 15.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  // await Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => pokedex(pokemon[index]))
                  // );
                  // setState(() {});
                  // print(pokemon);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
                  child: Hero(
                    tag: widget.pokedex.pokemonList[index].img,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, bottom: 10.0, left: 13.0, right: 22.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: ((widget
                                                        .pokedex
                                                        .pokemonList[index]
                                                        .discovered ==
                                                    true)
                                                ? (NetworkImage(widget.pokedex
                                                    .pokemonList[index].img))
                                                : (NetworkImage(
                                                    "https://cdn.bulbagarden.net/upload/d/dc/GO_Pok%C3%A9_Ball.png"))))),
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: <Widget>[Container(width: 20)],
                            ), //Spacing

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                PokeTitle((widget.pokedex.pokemonList[index]
                                            .discovered ==
                                        true)
                                    ? (widget.pokedex.pokemonList[index].name)
                                    : ("Undiscovered")),
                                Container(height: 4),
                                PokeText(widget.pokedex.pokemonList[index].num),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: widget.pokedex.pokemonList.length,
          ),
        );
        // }
        // return Center(child: CircularProgressIndicator());
      }),
    );
  }
}
