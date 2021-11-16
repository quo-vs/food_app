import 'package:flutter/material.dart';
import 'package:fooderlich/api/mock_food_service.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/models/models.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFoodService();

  ExploreScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];

          return Center(
            child: Container(
              child: TodayRecipeListView(recipes: recipes,)
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}