import 'package:flutter_market_app/data/model/file_model.dart';

class User {
  int id;
  String username;
  String nickname;
  FileModel profile;

  User({
    required this.id,
    required this.username,
    required this.nickname,
    required this.profile,
  });
  User.fromJson(Map<String, dynamic> map)
      : this(
            id: map['id'],
            username: map['username'],
            nickname: map['nickname'],
            profile: FileModel.fromJson(map['profileImage']));

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'nickname': nickname,
        'profile': profile.toJson(),
      };
}
