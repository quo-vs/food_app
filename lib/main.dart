import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/models/profile_manager.dart';
import 'package:fooderlich/navigation/app_router.dart';
import 'package:fooderlich/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatefulWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  State<Fooderlich> createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();
  final _appStateManager = AppStateManager();

  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      groceryManager: _groceryManager,
      profileManager: _profileManager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();

    return MaterialApp(
      title: 'Fooderlich',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => ProfileManager(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => GroceryManager(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => AppStateManager(),
          ),
        ],
        child: Consumer<ProfileManager>(
          builder: (context, profileManager, child) {
            ThemeData theme;
            if (profileManager.darkMode) {
              theme = FooderlichTheme.dark();
            } else {
              theme = FooderlichTheme.light();
            }

            return MaterialApp(
              theme: theme,
              title: 'Fooderlich',
              home: Router(
                routerDelegate: _appRouter,
              ),
            );
          },
        ),
      ),
    );
  }
}
