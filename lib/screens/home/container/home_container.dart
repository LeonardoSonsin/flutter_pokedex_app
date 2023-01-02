import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/common/error/failure.dart';
import 'package:flutter_pokedex_app/common/models/pokemon.dart';
import 'package:flutter_pokedex_app/common/repository/pokemon_repository.dart';
import 'package:flutter_pokedex_app/common/widgets/error_screen.dart';
import 'package:flutter_pokedex_app/common/widgets/loading_screen.dart';
import 'package:flutter_pokedex_app/screens/details/container/details_container.dart';
import 'package:flutter_pokedex_app/screens/home/pages/home_screen.dart';

class HomeContainer extends StatelessWidget {
  final IPokemonRepository repository;
  final Function(String, DetailsArguments) onItemTap;

  const HomeContainer({Key? key, required this.repository, required this.onItemTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomeScreen(list: snapshot.data!, onItemTap: onItemTap);
        }
        if (snapshot.hasError) {
          return ErrorScreen(error: (snapshot.error as Failure).message!);
        }
        return Container();
      },
    );
  }
}
