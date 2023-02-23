// To parse this JSON data, do
//
//     final pokemonListResponse = pokemonListResponseFromJson(jsonString);

import 'dart:convert';

PokemonListResponse pokemonListResponseFromJson(String str) => PokemonListResponse.fromJson(json.decode(str));

String pokemonListResponseToJson(PokemonListResponse data) => json.encode(data.toJson());

class PokemonListResponse {
  PokemonListResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  dynamic previous;
  List<Pokemon>? results;

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) => PokemonListResponse(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: json["results"] == null ? [] : List<Pokemon>.from(json["results"]!.map((x) => Pokemon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Pokemon {
  Pokemon({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
