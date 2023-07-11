import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/recipes_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipes = [];
  @override
  void initState() {
    super.initState();
    fetchRecipes().then((fetchedRecipes) {
      setState(() {
        recipes = fetchedRecipes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe.title),
            subtitle: Text(recipe.description),
            leading: Icon(Icons.food_bank),
            // You can display the ingredients as well if desired.
            // For example: Text(recipe.ingredients.join(', ')),
          );
        },
      ),
    );
  }

  Future<List<Recipe>> fetchRecipes() async {
    final String response =
        await rootBundle.loadString('assets/json/recipes.json');
    final jsonBody = await json.decode(response);

    final List<dynamic> recipeList = jsonBody['recipes'];
    return recipeList
        .map((json) => Recipe(
              title: json['title'],
              description: json['description'],
              ingredients: List<String>.from(json['ingredients']),
            ))
        .toList();
  }
}
