import 'package:flutter/material.dart';
import '../models/poke_detail.dart';
import '../services/pokeapi.dart';

class Detail extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  Detail({this.id, this.name, this.image});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  PokeDetail pokemonDetail;

  @override
  void initState() {
    super.initState();
    _getPokemonDetail();
  }

  _getPokemonDetail() async {
    final PokeDetail pokemonResult =
        await pokeApi.getPokemonDetail(widget.name);
    setState(() {
      pokemonDetail = pokemonResult;
    });
  }

  List<Widget> _buildPokemonProfile() {
    return [
      Text('Name : ${pokemonDetail.name}'),
      Text('Height : ${pokemonDetail.height.toString()} m'),
      Text('Weight : ${pokemonDetail.weight.toString()} kg'),
      Text('Base Experience : ${pokemonDetail.baseExperience.toString()}'),
      //Text('Abilities : ${pokemonDetail.abilities}'),
      Text(
        "Types",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: pokemonDetail.types
            .map((t) => FilterChip(
                backgroundColor: Colors.amber,
                label: Text(
                  t.type.name,
                  style: TextStyle(color: Colors.white),
                ),
                onSelected: (b) {}))
            .toList(),
      ),

      Text("Abilities", style: TextStyle(fontWeight: FontWeight.bold)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: pokemonDetail.abilities
            .map((t) => FilterChip(
                backgroundColor: Colors.red,
                label: Text(
                  t.ability.name,
                  style: TextStyle(color: Colors.white),
                ),
                onSelected: (b) {}))
            .toList(),
      ),
      Text("Forms", style: TextStyle(fontWeight: FontWeight.bold)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: pokemonDetail.forms == null
            ? <Widget>[Text("This is the final form")]
            : pokemonDetail.forms
                .map((n) => FilterChip(
                      backgroundColor: Colors.green,
                      label: Text(
                        n.name,
                        style: TextStyle(color: Colors.white),
                      ),
                      onSelected: (b) {},
                    ))
                .toList(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Card(
                  child: Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: 'pokemon-${widget.id}',
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.image),
                        ),
                      ),
                    ),
                    if (pokemonDetail == null) CircularProgressIndicator(),
                    if (pokemonDetail != null) ..._buildPokemonProfile()
                  ],
                ),
              ))),
        ));
  }
}
