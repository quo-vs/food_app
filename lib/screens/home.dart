import 'package:flutter/material.dart';
import 'package:fooderlich/models/app_state_manager.dart';
import 'package:fooderlich/models/foderlich_pages.dart';
import 'package:fooderlich/screens/explore_screen.dart';
import 'package:fooderlich/screens/grocery_screen.dart';
import 'package:fooderlich/screens/recipes_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: FooderlichPages.homePath,
      key: ValueKey(FooderlichPages.homePath),
      child: Home(
        currentTab: currentTab,
      ),
    );
  }

  final int currentTab;

  const Home({Key? key, required this.currentTab}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = [
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
      builder: (context, appStateManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Fooderlich',
                style: Theme.of(context).textTheme.headline6),
            actions: [_profileButton()],
          ),
          body: IndexedStack(
            index: widget.currentTab,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: widget.currentTab,
            onTap: (index) {
              Provider.of<AppStateManager>(context, listen: false).goToTab(index);
            },
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: 'Explore'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.book), label: 'Recipes'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: 'To Buy'),
            ],
          ),
        );
      },
    );
  }

  Widget _profileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/profile_pics/person_stef.jpeg'),
        ),
        onTap: () {
          // home -> profile
        },
      ),
    );
  }
}
