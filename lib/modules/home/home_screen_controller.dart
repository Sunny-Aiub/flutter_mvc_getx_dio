import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gigatech_coding_test/apis/details_response.dart';
import 'package:gigatech_coding_test/apis/pokemon_api.dart';
import 'package:gigatech_coding_test/models/pokemon_list_response.dart';


class GetHomeController extends GetxController {
  PokemonApi pokemonApi = PokemonApi();
  List<Pokemon> pokemonList = [];

  bool isLoading = true;
  String first = 'https://pokeapi.co/api/v2/pokemon?offset=0&limit=20';
  String next = '';
  PokemonDetails? pokemonDetails;
  ScrollController scrollController = ScrollController();

  String title = ' ';

  @override
  void onInit() {
    super.onInit();
    fetchAllPokemon(first);
    addItems();
    setTitle();
  }

  setTitle(){
    title = Get.arguments;
    update();
  }

  void fetchAllPokemon(String url) async {
    var response = await pokemonApi.getPokemonList(url);
    if (response != null) {
      print(response);
      final pokemonListResponse = PokemonListResponse.fromJson(response);
      next = pokemonListResponse.next ?? '';
      pokemonListResponse.results?.forEach((data) {
        pokemonList.add(data);
      });
      isLoading = false;
      update();
    }
  }
  resetData(){
    pokemonDetails = null;
    update();
  }

  addItems() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        print(next);
        fetchAllPokemon(next);
      }
    });
  }

  Future<dynamic> fetchPokemonAbilities(String url) async {
    var response = await pokemonApi.getDetails( url: url);
    if (response != null) {
      print(response);
      final pokemonDetailResponse = PokemonDetails.fromJson(response);
      pokemonDetails = pokemonDetailResponse;
      update();
    }
  }

}


