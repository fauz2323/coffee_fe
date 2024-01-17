class AuthModel {
  String message;
  User user;
  num persentase;

  AuthModel({
    required this.message,
    required this.persentase,
    required this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        message: json["message"],
        persentase: json["persentase"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
      };
}

class User {
  int id;
  String name;
  String username;
  String email;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
