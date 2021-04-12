import 'package:flutter/material.dart';
import 'package:pokedex/home/pokeball.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  ImageProvider logo = AssetImage('assets/img/pokedex.png');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: logo,
                  alignment: Alignment.center,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Bulbasaur'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ,
              // );
            },
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Ivysaur'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => PokedexPage(pokedexId: 2)),
              // );
            },
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Venusaur'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => PokedexPage(pokedexId: 3)),
              // );
            },
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Charmander'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => PokedexPage(pokedexId: 4)),
              // );
            },
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Charmeleon'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => PokedexPage(pokedexId: 5)),
              // );
            },
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Charizard'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => PokedexPage(pokedexId: 6)),
              // );
            },
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Squirtle'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => PokedexPage(pokedexId: 7)),
              // );
            },
          ),
          ListTile(
            leading: Icon(PokeballIcon.pokeball_icon),
            title: Text('Wartortle'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => PokedexPage(pokedexId: 8)),
              // );
            },
          )
        ],
      ),
    );
  }
}
