import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wishlist_hive_flutter/models/wishlist.dart';

class WishListDatabase {
  String _boxName = "WishList";
  var initialized = false;

  Future<void> _initHive() async {
    await Hive.initFlutter();

    if (!initialized) {
      initialized = true;

      Hive.registerAdapter<WishList>(WishListAdapter());
    }
  }

  Future<Box> wishListBox() async {
    print(initialized);
    await _initHive();
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

    var a = box.add(WishList(wishList.price, wishList.product));
    return a;
  }

  Future<void> deleteFromBox(int key) async {
    final box = await wishListBox();
    var a = box.delete(key);
    return a;
  }

  Future<void> deleteAll() async {
    final box = await wishListBox();
    var a = box.deleteFromDisk();
    return a;
  }

  Future<void> updateWish(int key, WishList wishList) async {
    final box = await wishListBox();
    var a = await box.put(key, wishList);
    return a;
  }
}
