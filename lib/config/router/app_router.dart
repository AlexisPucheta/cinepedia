import 'package:cinepedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
