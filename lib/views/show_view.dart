// import 'dart:math';

import 'package:flutter/material.dart';

import 'package:wt_pokemon/providers/pokemon_provider.dart';

import 'package:wt_pokemon/widgets.dart';

class ShowView extends StatefulWidget {
  final Pokedex pokedex;
  final String title;

  ShowView(this.pokedex, {Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _ShowViewState createState() => _ShowViewState();
}

class _ShowViewState extends State<ShowView> {
  // int _counter = 0;
  // Pokedex pokedex = widget.pokedex;

  Pokemon selectedPokemon;
  List<Pokemon> selectionGroup;
  PokeButton pokeButton1, pokeButton2, pokeButton3, pokeButton4;

  buttonFunction(PokeButton button) {
    if (button != null) {
      Pokemon pokemon = button.getPokemon();
      if (pokemon != null && selectedPokemon != null) {
        pokemon.id == selectedPokemon.id
            ? correctGuess(button)
            : failedGuess(button);
      }
    }
  }

  correctGuess(PokeButton button) {
    //Need to figure out how to access widget items
  }

  failedGuess(PokeButton button) {}

  @override
  void initState() {
    selectionGroup = widget.pokedex.generateWTPokemonSelection();
    selectedPokemon = selectionGroup[0];

    pokeButton1 =
        PokeButton(selectionGroup[0], selectionGroup[0].name, buttonFunction);
    pokeButton2 =
        PokeButton(selectionGroup[1], selectionGroup[1].name, buttonFunction);
    pokeButton3 =
        PokeButton(selectionGroup[2], selectionGroup[2].name, buttonFunction);
    pokeButton4 =
        PokeButton(selectionGroup[3], selectionGroup[3].name, buttonFunction);

    selectionGroup.shuffle();

    //Keep everything above
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xffd71010),

      appBar: AppBar(
        // Here we take the value from the ShowView object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
              0.1,
              0.2,
              0.4,
              0.5,
              0.7,
              0.8,
              1
            ],
                colors: [
              Color(0xffd71010).withOpacity(0.7),
              Color(0xffed6725).withOpacity(0.7),
              Color(0xffe3231c).withOpacity(0.7),
              Color(0xffd71010).withOpacity(0.7),
              Color(0xffed6725).withOpacity(0.7),
              Color(0xffed5553).withOpacity(0.7),
              Color(0xffd71010).withOpacity(0.7)
            ])),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ShaderMask(
                          blendMode: BlendMode.srcATop,
                          shaderCallback: (Rect bounds) {
                            return RadialGradient(
                              colors: [Color(0xfffefefe), Color(0xff5fd2c9)],
                            ).createShader(bounds);
                          },
                          child: Container(
                            height: 320.0,
                            width: 320.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(selectedPokemon.img))),
                          )),
                    ],
                  ),
                ],
              ),

              Container(height: 50),

              //Row 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      pokeButton1,
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      PokeButton(
                        selectionGroup[1],
                        selectionGroup[1].name,
                        buttonFunction,
                      ),
                    ],
                  ),
                ],
              ),

              //Container (Seperator)
              Container(height: 12),

              //Row 2
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      PokeButton(
                        selectionGroup[2],
                        selectionGroup[2].name,
                        buttonFunction,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      PokeButton(
                        selectionGroup[3],
                        selectionGroup[3].name,
                        buttonFunction,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
