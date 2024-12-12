class FileModel {
  int id;
  String url;
  String originName;
  String contentType;
  DateTime createdAt;

  FileModel({
    required this.id,
    required this.url,
    required this.originName,
    required this.contentType,
    required this.createdAt,
  });

  // fromJson 생성자
  FileModel.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        url = map['url'],
        originName = map['originName'],
        contentType = map['contentType'],
        createdAt = DateTime.parse(map['createdAt']);

  // toJson 메서드
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'originName': originName,
      'contentType': contentType,
      'createAt': createdAt.toIso8601String(),
    };
  }
}
