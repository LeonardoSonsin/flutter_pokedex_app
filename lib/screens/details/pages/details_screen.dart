import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/common/models/pokemon.dart';
import 'package:flutter_pokedex_app/screens/home/pages/widgets/pokemon_type.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pokemon.baseColor?.withOpacity(0.5),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: pokemon.baseColor?.withOpacity(0.5),
        child: Column(
          children: [
            Text(pokemon.name,
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            Column(
              children: [
                Text(pokemon.num,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 120.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/bg.png',
                      scale: 8,
                      opacity: const AlwaysStoppedAnimation(0.5),
                    ),
                    Image.network(pokemon.image, scale: 1),
                  ],
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: pokemon.type.map((type) => PokemonType(type: type, color: pokemon.color(type: type))).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
