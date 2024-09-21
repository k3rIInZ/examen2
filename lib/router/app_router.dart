import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:examen2/presentation/screens/create_screen.dart';
import 'package:examen2/presentation/screens/list_screen.dart';
import 'package:examen2/presentation/screens/update_screen.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ListScreen(),
      ),
      GoRoute(
        path: '/create',
        builder: (context, state) => const CreateScreen(),
      ),
      GoRoute(
        path: '/update/:id',
        builder: (context, state) {
          final ticketId = state.params['id'];
          return UpdateScreen(ticketId: ticketId!);
        },
      ),
    ],
  );
}
