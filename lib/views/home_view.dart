//Base Libraries
import 'package:flutter/material.dart';
import 'dart:convert';
//My Libraries
import 'package:wt_pokemon/widgets.dart';
import 'package:wt_pokemon/providers/pokemon_provider.dart';
//My Views
import 'package:wt_pokemon/views/show_view.dart';

//Home View
class HomeView extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final Pokedex pokedex;
  final String title;
  HomeView({required Key key, required this.title}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Pokedex pokedex;

  fetchData() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/pokedex.json");
    final jsonResult = jsonDecode(data);

    pokedex = Pokedex.fromJson(jsonResult);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    //(pokedex.isLoading) ? (Center(child : CircularProgressIndicator())) :
    return (Scaffold(
      backgroundColor: Color(0xffd71010),

      appBar: PokeAppBar(
        key: UniqueKey(),
        pokedex, context,
        // Here we take the value from the HomeView object that was created by
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(image: AssetImage("assets/title.png")),

              // Container(height: 15,),

              PokeButton(
                pokedex.pokemonList.first,
                "Start",
                () async {
                  await Navigator.push(
                      context,
                      PokePageRoute(ShowView(pokedex,
                          key: UniqueKey(), title: "Who's That Pokemon!?")));
                  setState(() {});
                  // print(notes);
                },
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
    ));
  }
}
