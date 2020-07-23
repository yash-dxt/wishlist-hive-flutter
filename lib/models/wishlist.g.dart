// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishListAdapter extends TypeAdapter<WishList> {
  @override
  WishList read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishList(
      fields[0] as int,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WishList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.product);
  }

  @override
  // TODO: implement typeId
  final typeId = 0;

}
