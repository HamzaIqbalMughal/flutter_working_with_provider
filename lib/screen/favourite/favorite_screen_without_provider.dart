import 'package:flutter/material.dart';

class FavouriteScreenWithoutProvider extends StatefulWidget {
  const FavouriteScreenWithoutProvider({super.key});

  @override
  State<FavouriteScreenWithoutProvider> createState() => _FavouriteScreenWithoutProviderState();
}

class _FavouriteScreenWithoutProviderState extends State<FavouriteScreenWithoutProvider> {

  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){
                      if(selectedItem.contains(index)){
                        selectedItem.remove(index);
                      }else{
                        selectedItem.add(index);
                      }
                      setState(() {

                      });
                    },
                    title: Text('Item '+index.toString()),
                    trailing: Icon(
                        selectedItem.contains(index) ? Icons.favorite : Icons.favorite_outline),
                  );
                }),
          )
        ],
      ),
    );
  }
}
