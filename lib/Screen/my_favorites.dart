// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_v1/Models/favorite_list_model.dart';
import 'package:provider_v1/Providers/providers.dart';

class MyFavoritesPage extends StatefulWidget {
  const MyFavoritesPage({super.key});

  @override
  State<MyFavoritesPage> createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {
  // Favorite App List Model class
  final _listItems = FavoriteListModel.favoriteList;

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteItemProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
      ),
      // body: FutureBuilder(
      // future: DBHelper.getFavorites(),
      // builder: (context, AsyncSnapshot<List<FavoriteListModel>> snapshot) {
      // if (!snapshot.hasData) {
      //   return const Center(
      //     child: CircularProgressIndicator(),
      //   );
      // }
      // return snapshot.data!.isEmpty
      //     ? Center(
      //         child: Text('Empty favorite list'),
      //       )
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favoriteProvider.selectedItem.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Consumer<FavoriteItemProvider>(
                  builder: (context, value, child) => ListTile(
                    onTap: () {
                      print(favoriteProvider.selectedItem[index]);
                    },
                    // title: Text('${favoriteProvider.selectedItem[index]}'),
                    leading: SizedBox(
                      width: 80.0,
                      child: Card(
                        margin: const EdgeInsets.only(right: 6.0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Image.asset(
                          _listItems[favoriteProvider.selectedItem[index]]
                              .image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                        '${_listItems[favoriteProvider.selectedItem[index]].title}'),
                    trailing: InkWell(
                      onTap: () {
                        favoriteProvider
                            .removeItems(favoriteProvider.selectedItem[index]);
                      },
                      child: const Icon(
                        Icons.favorite_rounded,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // }),
    );
  }
}

// Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: favoriteProvider.selectedItem.length,
      //         shrinkWrap: true,
      //         itemBuilder: (context, index) {
      //           return Consumer<FavoriteItemProvider>(
      //             builder: (context, value, child) => ListTile(
      //               onTap: () {
      //                 print(favoriteProvider.selectedItem[index]);
      //               },
      //               // title: Text('${favoriteProvider.selectedItem[index]}'),
      //               leading: SizedBox(
      //                 width: 80.0,
      //                 child: Card(
      //                   margin: const EdgeInsets.only(right: 6.0),
      //                   clipBehavior: Clip.antiAliasWithSaveLayer,
      //                   shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(6.0)),
      //                   child: Image.asset(
      //                     _listItems[favoriteProvider.selectedItem[index]]
      //                         .image!,
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),
      //               ),
      //               title: Text(
      //                   '${_listItems[favoriteProvider.selectedItem[index]].title}'),
      //               trailing: InkWell(
      //                 onTap: () {
      //                   favoriteProvider
      //                       .removeItems(favoriteProvider.selectedItem[index]);
      //                 },
      //                 child: const Icon(
      //                   Icons.favorite_rounded,
      //                   color: Colors.red,
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
