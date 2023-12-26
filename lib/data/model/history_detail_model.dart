class HistoryDetailModel {
  History history;

  HistoryDetailModel({
    required this.history,
  });

  factory HistoryDetailModel.fromJson(Map<String, dynamic> json) =>
      HistoryDetailModel(
        history: History.fromJson(json["history"]),
      );

  Map<String, dynamic> toJson() => {
        "history": history.toJson(),
      };
}

class History {
  int id;
  String userId;
  String uuid;
  String name;
  String red;
  String green;
  String blue;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  Image image;

  History({
    required this.id,
    required this.userId,
    required this.uuid,
    required this.name,
    required this.red,
    required this.green,
    required this.blue,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        userId: json["user_id"],
        uuid: json["uuid"],
        name: json["name"],
        red: json["red"],
        green: json["green"],
        blue: json["blue"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "uuid": uuid,
        "name": name,
        "red": red,
        "green": green,
        "blue": blue,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image.toJson(),
      };
}

class Image {
  int id;
  String historyId;
  String image;
  String uuid;
  DateTime createdAt;
  DateTime updatedAt;

  Image({
    required this.id,
    required this.historyId,
    required this.image,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        historyId: json["history_id"],
        image: json["image"],
        uuid: json["uuid"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "history_id": historyId,
        "image": image,
        "uuid": uuid,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
