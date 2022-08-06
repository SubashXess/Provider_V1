// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_v1/Models/favorite_list_model.dart';
import 'package:provider_v1/Providers/providers.dart';
import 'package:provider_v1/Screen/my_favorites.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  // Favorite App List Model class
  final _listItems = FavoriteListModel.favoriteList;

  // List<int> selectedItem = []; // without provider

  @override
  Widget build(BuildContext context) {
    print('Rebuild');

    // final favoriteProvider = Provider.of<FavoriteItemProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite App'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyFavoritesPage(),
                  ),
                );
              },
              child: const Icon(Icons.favorite_rounded),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // With Provider
          Expanded(
            child: ListView.builder(
              itemCount: _listItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Consumer<FavoriteItemProvider>(
                  builder: (context, value, child) => ListTile(
                    onTap: () {
                      if (value.selectedItem.contains(_listItems[index].id)) {
                        value.removeItems(_listItems[index].id!);
                      } else {
                        value.addItems(_listItems[index].id!);
                        // value.addItems(_listItems[index].image);
                        // value.addItems(_listItems[index].title);
                      }

                      print(_listItems[index].title!);
                    },
                    leading: SizedBox(
                      width: 80.0,
                      child: Card(
                        margin: const EdgeInsets.only(right: 6.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Image.asset(
                          _listItems[index].image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(_listItems[index].title.toString()),
                    trailing: Icon(
                      value.selectedItem.contains(_listItems[index].id!)
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded,
                      color: value.selectedItem.contains(_listItems[index].id!)
                          ? Colors.red
                          : Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),

          // with provider
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 40,
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) {
          //       return Consumer<FavoriteItemProvider>(
          //         builder: (context, value, child) => ListTile(
          //           onTap: () {
          //             if (value.selectedItem.contains(index)) {
          //               value.removeItems(index);
          //             } else {
          //               value.addItems(index);
          //             }

          //             print(index);
          //           },
          //           title: Text(value.selectedItem.contains(index)
          //               ? 'Selected Item $index'
          //               : 'Unselected Item $index'),
          //           trailing: Icon(
          //             value.selectedItem.contains(index)
          //                 ? Icons.favorite_rounded
          //                 : Icons.favorite_outline_rounded,
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),

          // Without Provider
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 40,
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         onTap: () {
          //           selectedItem.add(index);
          //           setState(() {});
          //         },
          //         title: Text('Index $index'),
          //         trailing: Icon(
          //           selectedItem.contains(index)
          //               ? Icons.favorite
          //               : Icons.favorite_outline_rounded,
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
