import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:wishlist_hive_flutter/models/wishlist.dart';
import 'package:wishlist_hive_flutter/screens/wishlist_screen.dart';
import 'package:wishlist_hive_flutter/services/wishlist_provider.dart';



void main() {
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
