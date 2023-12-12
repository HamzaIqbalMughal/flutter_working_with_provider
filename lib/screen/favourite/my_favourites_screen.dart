import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavouriteItemsScreen extends StatefulWidget {
  const MyFavouriteItemsScreen({super.key});

  @override
  State<MyFavouriteItemsScreen> createState() => _MyFavouriteItemsScreenState();
}

class _MyFavouriteItemsScreenState extends State<MyFavouriteItemsScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context);
    List<int> favouriteItems = favouriteProvider.selectedItem;
    favouriteItems.sort();
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite Screen'),
        // actions: [
        //   InkWell(
        //     onTap: () {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => MyFavouriteItemsScreen()));
        //     },
        //     child: Icon(Icons.favorite),
        //   ),
        //   SizedBox(
        //     width: 20,
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favouriteProvider.selectedItem.length,
              itemBuilder: (context, index) {
                return Consumer<FavouriteItemProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        favouriteProvider.removeItem(favouriteItems[index]);
                      },
                      title: Text('Item ' + favouriteItems[index].toString()),
                      trailing: Icon(Icons.favorite),
                      // trailing: Icon(value.selectedItem.contains(index)
                      //     ? Icons.favorite
                      //     : Icons.favorite_outline),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
