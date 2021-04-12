import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';
import 'package:pokedex/config.dart';
import '../models/poke_detail.dart';
import '../widgets/pokemon_card.dart';
import '../home/sidemenu.dart';
import '../services/pokeapi.dart';
import '../models/pokemon.dart';

import 'add_new_pokemon.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Pokemon> _userTransactions = [];
  KtList<Pokemon> _pokemonList = emptyList();
  //KtList<PokeDetail> _pokemonDetail = emptyList();
  bool _isLoading = false;
  final ScrollController _scrollController =
      ScrollController(debugLabel: 'pokemonSc');

  @override
  void initState() {
    super.initState();
    _fetchPokemonList();
    //  _fetchPokemonDetail();

    _scrollController.addListener(() {
      if (!_isLoading && _scrollController.position.extentAfter == 0.0) {
        _fetchPokemonList();
        //  _fetchPokemonDetail();
      }
    });
  }

  _fetchPokemonList() async {
    setState(() {
      _isLoading = true;
    });
    final pokemonList = await pokeApi.getPokemonList(_pokemonList.size);
    setState(() {
      _pokemonList = _pokemonList.plus(pokemonList);
      _isLoading = false;
    });
  }

  // _fetchPokemonDetail() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   final pokemonDetail = await pokeApi.getPokemonDetail(_pokemonDetail.size);
  //   setState(() {
  //     _pokemonDetail = _pokemonDetail.plus(pokemonDetail);
  //     _isLoading = false;
  //   });
  // }
  void _addNewTransaction(
    String name,
    String url,
  ) {
    final newTx = Pokemon(
      name: name,
      url: url,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: SideMenu(),
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                'Welcome to Poke Wizard',
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _startAddNewTransaction(context),
                ),
              ],
            ),
            body: CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300.0,
                    // mainAxisSpacing: 10.0,
                    // crossAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),

                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2),
                  delegate: SliverChildBuilderDelegate((ctx, index) {
                    var item = _pokemonList[index];

                    return PokemonCard(
                        id: item.id,
                        image: getPokemonImage(item.id),
                        name: item.name,
                        color: item.color,
                        key: ValueKey(item.id),
                        // name: item.name,
                        onTap: () {
                          Navigator.pushNamed(context, '/detail', arguments: {
                            'id': item.id,
                            'name': item.name,
                            'image': getPokemonImage(item.id)
                          });
                        });
                  }, childCount: _pokemonList.size),
                ),
                SliverToBoxAdapter(
                    child: _isLoading
                        ? Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox())
              ],
            )));
  }
}
