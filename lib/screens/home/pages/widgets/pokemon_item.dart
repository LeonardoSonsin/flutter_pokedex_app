import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/common/models/pokemon.dart';
import 'package:flutter_pokedex_app/screens/details/container/details_container.dart';
import 'package:flutter_pokedex_app/screens/home/pages/widgets/pokemon_type.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({Key? key, required this.pokemon, required this.onItemTap})
      : super(key: key);

  final Pokemon pokemon;
  final Function(String, DetailsArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        pokemonContainer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            pokemonInfo(),
            pokemonImage(),
          ],
        )
      ],
    );
  }

  Padding pokemonContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
          onItemTap('/details', DetailsArguments(pokemon: pokemon));
        },
        child: Ink(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: pokemon.baseColor!.withOpacity(0.5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Image.asset('assets/images/bg.png',
              opacity: const AlwaysStoppedAnimation(0.1),
              scale: 2,
              alignment: Alignment.centerRight),
        ),
      ),
    );
  }

  Padding pokemonInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        direction: Axis.vertical,
        spacing: 4.0,
        children: [
          Text('#${pokemon.num}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(pokemon.name,
              style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Wrap(
            spacing: 4.0,
            children: pokemon.type.map((e) => PokemonType(type: e, color: pokemon.color(type: e),)).toList(),
          ),
        ],
      ),
    );
  }

  Image pokemonImage() {
    return Image.network(
      pokemon.image,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Padding(
          padding: EdgeInsets.only(right: 58.0, top: 4.0),
          child: CircularProgressIndicator(),
        );
      },
      errorBuilder: (context, error, stackTrace) => Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: Image.asset('assets/types/pokeball.png', scale: 8),
      ),
    );
  }
}
