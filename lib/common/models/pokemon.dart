import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final String num;
  final String name;
  final String image;
  final List<String> type;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      image: json['img'],
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Color? get baseColor => color(type: type[0]);

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.image,
    required this.type,
  });

  Color? color({required String type}) {
    switch (type) {
      case 'Normal':
        return const Color.fromRGBO(145, 154, 162, 1);
      case 'Fire':
        return const Color.fromRGBO(255, 151, 65, 1);
      case 'Water':
        return const Color.fromRGBO(54, 146, 220, 1);
      case 'Grass':
        return const Color.fromRGBO(99, 187, 91, 1);
      case 'Electric':
        return const Color.fromRGBO(251, 209, 0, 1);
      case 'Ice':
        return const Color.fromRGBO(76, 209, 192, 1);
      case 'Fighting':
        return const Color.fromRGBO(224, 48, 106, 1);
      case 'Poison':
        return const Color.fromRGBO(180, 103, 205, 1);
      case 'Ground':
        return const Color.fromRGBO(232, 114, 54, 1);
      case 'Flying':
        return const Color.fromRGBO(137, 170, 227, 1);
      case 'Psychic':
        return const Color.fromRGBO(255, 102, 117, 1);
      case 'Bug':
        return const Color.fromRGBO(131, 195, 0, 1);
      case 'Rock':
        return const Color.fromRGBO(200, 182, 134, 1);
      case 'Ghost':
        return const Color.fromRGBO(76, 106, 178, 1);
      case 'Dark':
        return const Color.fromRGBO(91, 84, 102, 1);
      case 'Dragon':
        return const Color.fromRGBO(0, 111, 201, 1);
      case 'Steel':
        return const Color.fromRGBO(90, 142, 162, 1);
      case 'Fairy':
        return const Color.fromRGBO(251, 137, 235, 1);
      default:
        return null;
    }
  }
}
