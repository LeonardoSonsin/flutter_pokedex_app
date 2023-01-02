import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/common/repository/pokemon_repository.dart';
import 'package:flutter_pokedex_app/screens/route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokedexRoute(repository: PokemonRepository(dio: Dio())),
    );
  }
}
