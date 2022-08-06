import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_v1/Providers/providers.dart';
import 'package:provider_v1/Screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteItemProvider()),
      ],
      child: MaterialApp(
        title: 'Provider V1',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const HomePage(),
      ),
    );
  }
}
