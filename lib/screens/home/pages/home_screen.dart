import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/common/models/pokemon.dart';
import 'package:flutter_pokedex_app/screens/details/container/details_container.dart';
import 'package:flutter_pokedex_app/screens/home/pages/widgets/pokemon_item.dart';

class HomeScreen extends StatefulWidget {
  final List<Pokemon> list;
  final Function(String, DetailsArguments) onItemTap;

  const HomeScreen({Key? key, required this.list, required this.onItemTap})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int index) {
          return PokemonItem(pokemon: widget.list[index], onItemTap: widget.onItemTap);
        },
      ),
    );
  }
}
