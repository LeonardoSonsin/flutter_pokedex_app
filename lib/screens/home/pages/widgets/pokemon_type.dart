import 'package:flutter/material.dart';

class PokemonType extends StatelessWidget {
  const PokemonType({Key? key, required this.type, required this.color})
      : super(key: key);

  final String type;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(4.0)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(_icon(type: type)!)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 8.0, 8.0, 8.0),
              child: Text(
                type,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _icon({required String type}) {
    switch (type) {
      case 'Normal':
        return 'assets/types/normal.png';
      case 'Fire':
        return 'assets/types/fire.png';
      case 'Water':
        return 'assets/types/water.png';
      case 'Grass':
        return 'assets/types/grass.png';
      case 'Electric':
        return 'assets/types/electric.png';
      case 'Ice':
        return 'assets/types/ice.png';
      case 'Fighting':
        return 'assets/types/fighting.png';
      case 'Poison':
        return 'assets/types/poison.png';
      case 'Ground':
        return 'assets/types/ground.png';
      case 'Flying':
        return 'assets/types/flying.png';
      case 'Psychic':
        return 'assets/types/psychic.png';
      case 'Bug':
        return 'assets/types/bug.png';
      case 'Rock':
        return 'assets/types/rock.png';
      case 'Ghost':
        return 'assets/types/ghost.png';
      case 'Dark':
        return 'assets/types/dark.png';
      case 'Dragon':
        return 'assets/types/dragon.png';
      case 'Steel':
        return 'assets/types/steel.png';
      case 'Fairy':
        return 'assets/types/fairy.png';
      default:
        return null;
    }
  }
}
