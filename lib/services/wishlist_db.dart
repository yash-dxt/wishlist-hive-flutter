import 'package:hive/hive.dart';
import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wishlist_hive_flutter/models/wishlist.dart';

class WishListDatabase {
  String _boxName = "WishList";

  Future<Box> wishListBox() async {
    var box = await Hive.openBox<WishList>(_boxName);
    return box;
  }

  Future<List<WishList>> getFullWishList() async {
    final box = await wishListBox();
    List<WishList> wishList = box.values.toList();
    return wishList;
  }

  Future<int> addToBox(WishList wishList) async {
    final box = await wishListBox();

    var a = await box.add(WishList(wishList.price, wishList.product));
    return a;
  }

  Future<void> deleteFromBox(int index) async {
    final box = await wishListBox();
    await box.deleteAt(index);
  }

  Future<void> deleteAll() async {
    final box = await wishListBox();
    await box.clear();
  }

  Future<void> updateWish(int index, WishList wishList) async {
    final box = await wishListBox();
    await box.putAt(index, wishList);
  }
}
