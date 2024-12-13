import 'package:flutter_market_app/data/model/address.dart';
import 'package:flutter_market_app/data/model/user.dart';

class ChatProduct {
  int id;
  String title;
  User user;
  Address address;
  int price;

  ChatProduct({
    required this.id,
    required this.title,
    required this.user,
    required this.address,
    required this.price,
  });

  ChatProduct.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          title: map['title'],
          user: User.fromJson(map['user']),
          address: Address.fromJson(map['address']),
          price: map['price'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'user': user.toJson(),
        'address': address.toJson(),
        'price': price,
      };
}