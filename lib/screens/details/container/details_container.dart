import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/common/error/failure.dart';
import 'package:flutter_pokedex_app/common/models/pokemon.dart';
import 'package:flutter_pokedex_app/common/repository/pokemon_repository.dart';
import 'package:flutter_pokedex_app/common/widgets/error_screen.dart';
import 'package:flutter_pokedex_app/common/widgets/loading_screen.dart';
import 'package:flutter_pokedex_app/screens/details/pages/details_screen.dart';

class DetailsArguments {
  final String name;
  final String image;

  DetailsArguments({required this.name, required this.image});
}

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({Key? key, required this.repository, required this.arguments}) : super(key: key);

  final IPokemonRepository repository;
  final DetailsArguments arguments;

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
          return DetailsScreen(name: arguments.name, image: arguments.image,);
        }
        if (snapshot.hasError) {
          return ErrorScreen(error: (snapshot.error as Failure).message!);
        }
        return Container();
      },
    );
  }
}
