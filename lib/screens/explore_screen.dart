import 'package:flutter/material.dart';
import 'package:fooderlich/api/mock_food_service.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/models/models.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFoodService();
  late ScrollController _scrollCotroller;

  _scrollListener() {
    if (_scrollCotroller.offset >= _scrollCotroller.position.maxScrollExtent &&
        !_scrollCotroller.position.outOfRange) {
      print('i am at the bottom!');
    }

    if (_scrollCotroller.offset <= _scrollCotroller.position.minScrollExtent && !_scrollCotroller.position.outOfRange) {
      print('i am at the top');
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollCotroller = ScrollController();
    _scrollCotroller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollCotroller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            controller: _scrollCotroller,
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
              const SizedBox(
                height: 16,
              ),
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? [])
            ],
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
