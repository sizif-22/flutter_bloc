class Character {
  int charId;
  String name;
  String imageUrl;

  Character.fromJson(Map<String, dynamic> json)
    : charId = json['id'],
      name = json['name'],
      imageUrl = json['image'];
}
