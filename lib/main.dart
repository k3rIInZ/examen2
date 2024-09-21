import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:examen2/router/app_router.dart';
import 'package:provider/provider.dart';
import 'package:examen2/providers/ticket_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TicketProvider()..fetchTickets()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter().router,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
