import 'package:wt_pokemon/widgets.dart';

class Pokedex {
  bool isLoading = true;
  List<Pokemon> pokemonList = new List<Pokemon>.empty();
  List<Pokemon> discoveredList = new List<Pokemon>.empty();
  List<Pokemon> undiscoveredList = new List<Pokemon>.empty();

  //Constructor (Reads from JSON)
  Pokedex.fromJson(Map<String, dynamic> json) {
    if (json["pokemon"] != null) {
      json["pokemon"].forEach((temp) {
        Pokemon pokemon = new Pokemon.fromJson(temp);
        pokemonList.add(pokemon);
        (pokemon.discovered == true)
            ? discoveredList.add(pokemon)
            : undiscoveredList.add(pokemon);
      });

      isLoading = false;
    }
  }

  //Writes to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["pokemonList"] = this.pokemonList.map((v) => v.toJson()).toList();
    return data;
  }

  discover(Pokemon pokemon) {
    if (!pokemon.discovered) {
      pokemon.discovered = true;
      undiscoveredList.remove(pokemon);
      discoveredList.add(pokemon);
    }
  }

  undiscover(Pokemon pokemon) {
    if (pokemon.discovered) {
      pokemon.discovered = false;
      undiscoveredList.add(pokemon);
      discoveredList.remove(pokemon);
    }
  }

  List<Pokemon> generateWTPokemonSelection() {
    List<Pokemon> retList = new List<Pokemon>.empty();

    //Gets 1 random (undiscovered pokemon) (always index 0)
    if (undiscoveredList.length > 0) {
      retList.add(undiscoveredList[getRandom(undiscoveredList.length)]);

      //Builds list
      while (retList.length < 4) {
        Pokemon potentialPoke = pokemonList[getRandom(pokemonList.length)];

        //Checks if pokemon isn't already in the list
        bool addPoke = true;
        for (int index = 0; index < retList.length; index++) {
          Pokemon poke = retList[index];

          if (poke.id == potentialPoke.id) {
            addPoke = false;
            break;
          }
        }

        //If not in list: adds to list
        if (addPoke) {
          retList.add(potentialPoke);
        }
      }
    }

    return retList;
  }
}

class Pokemon {
  //Properties
  late int id;
  late String num;
  late String name;
  late bool discovered;
  late String img;
  late List<String> type;
  late String height;
  late String weight;
  late String candy;
  late int candyCount;
  late String egg;
  late String spawnChance;
  late String avgSpawns;
  late String spawnTime;
  late List<double> multipliers;
  late List<String> weaknesses;
  late List<NextEvolution> nextEvolution;

  //Constructor
  Pokemon(
      {required this.id,
      required this.num,
      required this.name,
      required this.discovered,
      required this.img,
      required this.type,
      required this.height,
      required this.weight,
      required this.candy,
      required this.candyCount,
      required this.egg,
      required this.spawnChance,
      required this.avgSpawns,
      required this.spawnTime,
      required this.multipliers,
      required this.weaknesses,
      required this.nextEvolution});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    num = json["num"];
    name = json["name"];
    discovered = json["discovered"];
    img = json["img"];
    type = json["type"].cast<String>();
    height = json["height"];
    weight = json["weight"];
    candy = json["candy"];
    candyCount = json["candy_count"];
    egg = json["egg"];
    spawnChance = json["spawn_chance"].toString();
    avgSpawns = json["avg_spawns"].toString();
    spawnTime = json["spawn_time"];
    multipliers = json["multipliers"]?.cast<double>();
    weaknesses = json["weaknesses"].cast<String>();
    if (json["next_evolution"] != null) {
      nextEvolution = new List<NextEvolution>.empty();
      json["next_evolution"].forEach((v) {
        nextEvolution.add(new NextEvolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["num"] = this.num;
    data["name"] = this.name;
    data["img"] = this.img;
    data["type"] = this.type;
    data["height"] = this.height;
    data["weight"] = this.weight;
    data["candy"] = this.candy;
    data["candy_count"] = this.candyCount;
    data["egg"] = this.egg;
    data["spawn_chance"] = this.spawnChance;
    data["avg_spawns"] = this.avgSpawns;
    data["spawn_time"] = this.spawnTime;
    data["multipliers"] = this.multipliers;
    data["weaknesses"] = this.weaknesses;
    data["next_evolution"] = this.nextEvolution.map((v) => v.toJson()).toList();
    return data;
  }
}

class NextEvolution {
  late String num;
  late String name;

  NextEvolution({required this.num, required this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json["num"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["num"] = this.num;
    data["name"] = this.name;
    return data;
  }
}
