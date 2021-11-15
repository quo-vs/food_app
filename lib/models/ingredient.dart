part of 'explore_recipe.dart';

class Ingredient {
  String imageUrl;
  String title;

  Ingredient({
    required this.imageUrl,
    required this.title,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      imageUrl: json['imageUrl'] ?? '', 
      title: json['title'] ?? '', 
    );
  }
}