import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/common/models/pokemon.dart';
import 'package:flutter_pokedex_app/screens/details/container/details_container.dart';

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
            return pokemonContainer(index);
          }),
    );
  }

  Widget pokemonContainer(int index) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          padding: const EdgeInsets.all(16.0),
          height: 105,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: Colors.blueGrey[50]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#${widget.list[index].num}",
                style: const TextStyle(color: Colors.orange),
              ),
              Text(
                widget.list[index].name,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800]),
              ),
              elementWidget(index),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Image.network(
            widget.list[index].image,
            errorBuilder: (context, error, stackTrace) => const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.error),
            ),
          ),
        ),
      ],
    );
  }

  Widget elementWidget(int index) {
    var elementList = widget.list[index].type;

    if (elementList.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(20.0)),
            child: Row(
              children: [
                elementList[0] == "Water"
                    ? const Icon(Icons.water, size: 16)
                    : elementList[0] == "Fire"
                        ? const Icon(Icons.fireplace, size: 16)
                        : elementList[0] == "Grass"
                            ? const Icon(Icons.grass, size: 16)
                            : elementList[0] == "Poison"
                                ? const Icon(Icons.near_me,
                                    size: 16)
                                : elementList[0] == "Flying"
                                    ? const Icon(Icons.cloud,
                                        size: 16)
                                    : elementList[0] == "Bug"
                                        ? const Icon(
                                            Icons.bug_report,
                                            size: 16)
                                        : elementList[0] == "Ground"
                                            ? const Icon(
                                                Icons.grain_rounded,
                                                size: 16)
                                            : elementList[0] == "Normal"
                                                ? const Icon(
                                                    Icons.stop,
                                                    size: 16)
                                                : elementList[0] == "Electric"
                                                    ? const Icon(
                                                        Icons.storm,
                                                        size: 16)
                                                    : elementList[0] ==
                                                            "Fighting"
                                                        ? const Icon(
                                                            Icons.handshake,
                                                            size: 16)
                                                        : elementList[0] ==
                                                                "Psychic"
                                                            ? const Icon(
                                                                Icons
                                                                    .psychology,
                                                                size: 16)
                                                            : elementList[0] ==
                                                                    "Rock"
                                                                ? const Icon(
                                                                    Icons
                                                                        .album_outlined,
                                                                    size: 16)
                                                                : elementList[
                                                                            0] ==
                                                                        "Ice"
                                                                    ? const Icon(
                                                                        Icons.flight,
                                                                        size: 16)
                                                                    : elementList[0] == "Dragon"
                                                                        ? const Icon(Icons.point_of_sale_outlined, size: 16)
                                                                        : const SizedBox.shrink(),
                Text(elementList[0]),
              ],
            ),
          ),
          elementList.length > 1
              ? Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Row(
                    children: [
                      elementList[1] == "Water"
                          ? const Icon(Icons.water, size: 16)
                          : elementList[1] == "Fire"
                              ? const Icon(Icons.fingerprint_rounded, size: 16)
                              : elementList[1] == "Grass"
                                  ? const Icon(Icons.grass, size: 16)
                                  : elementList[1] == "Poison"
                                      ? const Icon(Icons.point_of_sale_outlined,
                                          size: 16)
                                      : elementList[1] == "Flying"
                                          ? const Icon(
                                              Icons.point_of_sale_outlined,
                                              size: 16)
                                          : elementList[1] == "Bug"
                                              ? const Icon(
                                                  Icons.point_of_sale_outlined,
                                                  size: 16)
                                              : elementList[1] == "Normal"
                                                  ? const Icon(
                                                      Icons
                                                          .point_of_sale_outlined,
                                                      size: 16)
                                                  : elementList[1] == "Electric"
                                                      ? const Icon(
                                                          Icons
                                                              .point_of_sale_outlined,
                                                          size: 16)
                                                      : elementList[1] ==
                                                              "Fighting"
                                                          ? const Icon(
                                                              Icons
                                                                  .point_of_sale_outlined,
                                                              size: 16)
                                                          : elementList[1] ==
                                                                  "Psychic"
                                                              ? const Icon(
                                                                  Icons
                                                                      .point_of_sale_outlined,
                                                                  size: 16)
                                                              : elementList[1] ==
                                                                      "Rock"
                                                                  ? const Icon(
                                                                      Icons
                                                                          .point_of_sale_outlined,
                                                                      size: 16)
                                                                  : elementList[1] ==
                                                                          "Ice"
                                                                      ? const Icon(
                                                                          Icons
                                                                              .point_of_sale_outlined,
                                                                          size:
                                                                              16)
                                                                      : elementList[1] == "Dragon"
                                                                          ? const Icon(Icons.point_of_sale_outlined, size: 16)
                                                                          : const SizedBox.shrink(),
                      Text(elementList[1]),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
