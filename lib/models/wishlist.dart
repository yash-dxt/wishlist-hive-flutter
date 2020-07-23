import 'package:hive/hive.dart';

part 'wishlist.g.dart';

@HiveType(typeId: 0)
class WishList {
  @HiveField(0)
  final int price;

  @HiveField(1)
  final String product;

  WishList(this.price, this.product);
}
