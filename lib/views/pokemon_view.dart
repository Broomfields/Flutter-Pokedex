// import 'package:flutter/material.dart';


// import 'package:wt_pokemon/widgets.dart';

// enum PokemonMode {
//   Edit,
//   Add,
// }

// class PokemonView extends StatefulWidget {

//   // ignore: non_constant_identifier_names
//   final PokemonMode pokemonMode;
//   // final int index;
//   final Map<String, dynamic> pokemonStructure;

//   PokemonView(this.pokemonMode, this.pokemonStructure);

//   @override
//   _PokemonState createState() => _PokemonState();
// }

// class _PokemonState extends State<PokemonView> {

//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _textController = TextEditingController();

//   // List<Map<String, String>> get _pokemon => PokemonInheritedWidget.of(context).pokemon;

//   @override
//   void didChangeDependencies() {
      
//       if(widget.pokemonMode == PokemonMode.Edit) {
//         //Sets pokemon text from list
//         _titleController.text = widget.pokemonStructure["title"];
//         _textController.text = widget.pokemonStructure["text"];
//       }
      

//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(

//         title: Text(widget.pokemonMode == PokemonMode.Add ? "Add PokemonView" : "Edit PokemonView"),

//         backgroundColor: Color(0xff517933),

//       ),


//       body: Padding(
//         padding: const EdgeInsets.all(40.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[

//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(
//                 hintText: "PokemonView Title",
//               ),
//             ),

//             Container(height: 8,),

//             TextField(
//               controller: _textController,
//               decoration: InputDecoration(
//                 hintText: "PokemonView Text",
//               ),
//             ),


//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[

//                   PokeButton("Save", () {
                   
//                     final title = _titleController.text;
//                     final text = _textController.text;
                    
//                     //If widget !null, set title && text
//                     // if(widget?.pokemonMode == PokemonMode.Add) { //Add Mode
//                     //   //Adds pokemon
//                     //   PokemonProvider.insertPokemon({
//                     //     "title": title,
//                     //     "text": text
//                     //   });

//                     //   //Exits page
//                     //   Navigator.pop(context);
//                     // }
//                     // else if(widget?.pokemonMode == PokemonMode.Edit) { //Edit Mode

//                     //   //Adds pokemon to map
//                     //   PokemonProvider.updatePokemon({
//                     //     "id": widget.pokemonStructure["id"],
//                     //     "title": _titleController.text,
//                     //     "text": _textController.text
//                     //   });

//                     //   //Exits page
//                     //   Navigator.pop(context);
//                     // }
//                   }),


//                   PokeButton("Cancel", () {
                    
//                     //Exits page
//                     Navigator.pop(context);

//                   }),


//                   widget.pokemonMode == PokemonMode.Edit ?
//                     PokeButton("Delete", () async {
                      
//                       //Removes pokemon from list
//                       // await PokemonProvider.deletePokemon(widget.pokemonStructure["id"]);

//                       //Exits page
//                       Navigator.pop(context);

//                     })
//                   : Container(),

//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }