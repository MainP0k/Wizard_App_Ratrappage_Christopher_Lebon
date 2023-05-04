import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'screens/wizard_list_screen.dart';
import 'screens/wizard_detail_screen.dart';
import 'services/wizard_service.dart';

void main() {
  final goRouter = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage(child: WizardListScreen());
          }),
      GoRoute(
          path: '/wizard/:id',
          pageBuilder: (context, state) {
            final id = state.params['id'];
            return MaterialPage(child: WizardDetailScreen(wizardId: id!));
          }),
    ],
  );

  runApp(MyApp(goRouter: goRouter));
}

class MyApp extends StatelessWidget {
  final GoRouter goRouter;

  MyApp({required this.goRouter});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WizardService(),
      child: MaterialApp.router(
        title: 'Wizard World',
        routerDelegate: goRouter.routerDelegate,
        routeInformationParser: goRouter.routeInformationParser,
      ),
    );
  }
}