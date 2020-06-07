
import 'package:flutter/material.dart';
// import 'package:wt_pokemon/providers/pokemon_provider.dart';
import 'package:wt_pokemon/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'PokeGuesser',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Color(0xfffecb06),
        primaryColor: Color(0xfffecb06),

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(title: "PokeGuesser"),
    );
  }
}

// body: FutureBuilder(
//     future: DefaultAssetBundle.of(context).loadString('assets/pokedex.json'),
//     builder: (context, snapshot) {
//       if(snapshot.connectionState == ConnectionState.done) {
//         final List<Pokemon> pokemon = snapshot.data;

// if(pokedex.pokemonList != null) {
//   if(pokedex.pokemonList.length > 100) {
//     success = true;
//   }
// }

// return success;