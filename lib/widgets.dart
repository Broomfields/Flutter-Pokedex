import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wt_pokemon/providers/pokemon_provider.dart';
// import 'package:wt_pokemon/providers/pokemon_provider.dart';
import 'package:wt_pokemon/views/pokemon_list_view.dart';

class PokeButton extends StatelessWidget {
  final Pokemon _pokemon;
  final String _text;
  final Function _onPressed;

  PokeButton(this._pokemon, this._text, this._onPressed);

  final Color standardColour = Color(0xfffecb06);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        _pokemon.name,
        style: TextStyle(
            color: Color(0xff355fa0),
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
      color: standardColour,
      minWidth: 170,
      height: 43,
      onPressed: (_pokemon == null) ? _onPressed(_text) : _onPressed(this),
    );
  }

  getPokemon() {
    return this._pokemon;
  }
}

class PokeAppBar extends AppBar {
  PokeAppBar(pokedex, context, {required Key key, required Widget title})
      : super(key: key, title: title, actions: <Widget>[
          new IconButton(
            icon: new Image.asset("assets/pokedex.jpg"),
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PokemonListView(pokedex,
                          key: UniqueKey(), title: "Pokedex")));
              // print(notes);
            },
          )
        ]);
}

class PokeTitle extends StatelessWidget {
  final String _title;

  PokeTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class PokeText extends StatelessWidget {
  final String _text;

  PokeText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}

getRandom(int max) {
  final _random = new Random();
  return (_random.nextInt(max));
}

class PokePageRoute extends PageRouteBuilder {
  PokePageRoute(Widget page)
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              page,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              ScaleTransition(
            scale: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}
