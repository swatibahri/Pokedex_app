import 'package:flutter/material.dart';
import 'dart:math';

class Pokemon {
  String name;
  String url;
  String id;
  Color color;

  Pokemon({this.name, this.url, this.color});

  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(
        100, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  Pokemon.fromJson(Map<String, dynamic> json) {
    final paths = json['url'].toString().split('/');
    name = json['name'];
    url = json['url'];
    color = getColor();
    id = paths[paths.length - 2].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['id'] = this.id;
    data['color'] = this.color;
    return data;
  }
}
