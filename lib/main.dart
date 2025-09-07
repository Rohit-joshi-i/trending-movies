import 'package:flutter/material.dart';
import 'package:trending_movies/app/ui/loading_page/loading_page.dart';
import 'package:trending_movies/services/api/api_service_manager.dart';
import 'package:trending_movies/services/hivedb/hive_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceManager.init(baseUrl: '', isDebug: true);

  HiveManager().registerAdapter();

  await HiveManager().initHive();
  await HiveManager().initNowPlayingMovies();
  await HiveManager().initTrendingMovies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(backgroundColor: Colors.black, body: LoadingPage()),
    );
  }
}
