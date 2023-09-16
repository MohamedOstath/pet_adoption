import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cache/cache.dart';
import '../../../../core/storage/local/database/model/pet.dart';
import '../../../../route/Routes.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Pet> items;

  CustomSearchDelegate({required this.items});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            Icons.clear,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    items.where(
        (element) => element.name.toLowerCase().contains(query.toLowerCase()));

    matchQuery.addAll(items
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .map((e) => e.name));

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            close(context, null);
            navigateToDetails(context, items[index]);
          },
          child: ListTile(
            title: Text(matchQuery[index]),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    items.where(
        (element) => element.name.toLowerCase().contains(query.toLowerCase()));

    matchQuery.addAll(items
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .map((e) => e.name));

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            close(context, null);
            navigateToDetails(context, items[index]);
          },
          child: ListTile(
            title: Text(matchQuery[index]),
          ),
        );
      },
    );
  }
}

navigateToDetails(BuildContext context, Pet pet) {
  CacheData().setPetId(pet.id);
  Navigator.pushNamed(context, Routes.petDetailsView);
}
