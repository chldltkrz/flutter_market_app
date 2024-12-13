import 'package:flutter_market_app/data/model/address.dart';
import 'package:flutter_market_app/data/model/file_model.dart';
import 'package:flutter_market_app/data/model/product_category.dart';
import 'package:flutter_market_app/data/model/user.dart';

class Product {
  int id;
  String title;
  String content;
  List<FileModel> imageFiles;
  User user;
  Address address;
  ProductCategory category;
  int price;
  int likeCnt;
  bool myLlike;
  DateTime updatedAt;
  DateTime createdAt;

  Product({
    required this.id,
    required this.title,
    required this.content,
    required this.imageFiles,
    required this.user,
    required this.address,
    required this.category,
    required this.price,
    required this.likeCnt,
    required this.myLlike,
    required this.updatedAt,
    required this.createdAt,
  });

  Product.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          title: map['title'],
          content: map['content'],
          imageFiles: List<FileModel>.from(
              map['imageFiles'].map((x) => FileModel.fromJson(x))).toList(),
          user: User.fromJson(map['user']),
          address: Address.fromJson(map['address']),
          category: ProductCategory.fromJson(map['category']),
          price: map['price'],
          likeCnt: map['likeCnt'],
          myLlike: map['myLike'],
          updatedAt: DateTime.parse(map['updatedAt']),
          createdAt: DateTime.parse(map['createdAt']),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'imageFiles': imageFiles.map((x) => x.toJson()).toList(),
        'user': user.toJson(),
        'address': address.toJson(),
        'category': category.toJson(),
        'price': price,
        'linkCnt': likeCnt,
        'myLike': myLlike,
        'updatedAt': updatedAt.toIso8601String(),
        'createdAt': createdAt.toIso8601String(),
      };

  // copywith method
  Product copyWith({
    int? id,
    String? title,
    String? content,
    List<FileModel>? imageFiles,
    User? user,
    Address? address,
    ProductCategory? category,
    int? price,
    int? likeCnt,
    bool? myLlike,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      imageFiles: imageFiles ?? this.imageFiles,
      user: user ?? this.user,
      address: address ?? this.address,
      category: category ?? this.category,
      price: price ?? this.price,
      likeCnt: likeCnt ?? this.likeCnt,
      myLlike: myLlike ?? this.myLlike,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
