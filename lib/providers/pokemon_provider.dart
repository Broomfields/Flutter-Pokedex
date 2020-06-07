import 'package:wt_pokemon/widgets.dart';

class Pokedex {

  bool isLoading = true;
  List<Pokemon> pokemonList = new List<Pokemon>();
  List<Pokemon> discoveredList = new List<Pokemon>();
  List<Pokemon> undiscoveredList = new List<Pokemon>();

  //Constructor (Reads from JSON)
  Pokedex.fromJson(Map<String, dynamic> json) {
    if (json["pokemon"] != null) {
      json["pokemon"].forEach((temp) {
        Pokemon pokemon = new Pokemon.fromJson(temp);
        pokemonList.add(pokemon);
        (pokemon.discovered == true) ? discoveredList.add(pokemon) : undiscoveredList.add(pokemon);
      });

      isLoading = false;
    }
  }

  //Writes to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemonList != null) {
      data["pokemonList"] = this.pokemonList.map((v) => v.toJson()).toList();
    }
    return data;
  }

  discover(Pokemon pokemon) {
    if(!pokemon.discovered) {
      pokemon.discovered = true;
      undiscoveredList.remove(pokemon);
      discoveredList.add(pokemon);
    }
  }

  undiscover(Pokemon pokemon) {
    if(pokemon.discovered) {
      pokemon.discovered = false;
      undiscoveredList.add(pokemon);
      discoveredList.remove(pokemon);
    }
  }

  List<Pokemon> generateWTPokemonSelection() {
    
    List<Pokemon> retList = new List<Pokemon>();
    
    //Gets 1 random (undiscovered pokemon) (always index 0)
    if(undiscoveredList.length > 0) {
      retList.add(undiscoveredList[getRandom(undiscoveredList.length)]);

      //Builds list
      while(retList.length < 4) {
        Pokemon potentialPoke = pokemonList[getRandom(pokemonList.length)];
        
        //Checks if pokemon isn't already in the list
        bool addPoke = true;
        for(int index = 0; index < retList.length; index++) { 
          Pokemon poke = retList[index];

          if(poke.id == potentialPoke.id) {
            addPoke = false;
            break;
          } 
        }

        //If not in list: adds to list
        if(addPoke) {
          retList.add(potentialPoke);
        }

      }
    }

    return retList;
  }
}

class Pokemon {

  //Properties
  int id;
  String num;
  String name;
  bool discovered;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  String spawnChance;
  String avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<String> weaknesses;
  List<NextEvolution> nextEvolution;

  //Constructor
  Pokemon({
      this.id,
      this.num,
      this.name,
      this.discovered,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.candyCount,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.multipliers,
      this.weaknesses,
      this.nextEvolution});

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
      nextEvolution = new List<NextEvolution>();
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
    if (this.nextEvolution != null) {
      data["next_evolution"] =
          this.nextEvolution.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NextEvolution {
  String num;
  String name;

  NextEvolution({this.num, this.name});

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
