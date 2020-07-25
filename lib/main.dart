import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:wishlist_hive_flutter/models/wishlist.dart';
import 'package:wishlist_hive_flutter/screens/wishlist_screen.dart';
import 'package:wishlist_hive_flutter/services/wishlist_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  var initialized = false;
  print(initialized);
  if (!initialized) {
    initialized = true;
    await Hive.initFlutter();

    Hive.registerAdapter<WishList>(WishListAdapter());
  }
  print(initialized);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        var wishListProvider = WishListProvider();
        wishListProvider.fetchWishList();
        return wishListProvider;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WishListScreen(),
      ),
    );
  }
}
