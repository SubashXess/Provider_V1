import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_v1/Screen/favoritepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoritePage()));
                },
                color: Colors.deepPurple,
                textColor: Colors.white,
                child: const Text('Favorite Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
