import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:wishlist_hive_flutter/models/wishlist.dart';
import 'package:wishlist_hive_flutter/services/wishlist_db.dart';

class WishListProvider with ChangeNotifier {
  List<WishList> _wishList = [];

  UnmodifiableListView<WishList> get wishList {
    return UnmodifiableListView(_wishList);
  }

  WishListDatabase wishListDatabase = WishListDatabase();

  int get wishListCount {
    return _wishList.length;
  }

  void fetchWishList() {
    wishListDatabase.getFullWishList().then((value) {
      _wishList = value;
      notifyListeners();
    });
  }

  void addNewWishList({int price, String product}) {
    wishListDatabase.addToBox(WishList(price, product));
    fetchWishList();

    print(wishListCount);
  }

  void removeFromWishList(int key) {
    wishListDatabase.deleteFromBox(key);
    fetchWishList();
    print(wishListCount);
  }

  void removeAll() {
    wishListDatabase.deleteAll();
    fetchWishList();
  }

  void updateWishList({int price, String product, int key}) {
    wishListDatabase.updateWish(key, WishList(price, product));
    fetchWishList();
  }

  WishList getWish(int index) {
    return _wishList[index];
  }

//  get wishList() => _wishList;
}
