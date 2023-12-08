class HistoryModel {
  List<ListHistory> listHistory;

  HistoryModel({
    required this.listHistory,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        listHistory: List<ListHistory>.from(
            json["listHistory"].map((x) => ListHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listHistory": List<dynamic>.from(listHistory.map((x) => x.toJson())),
      };
}

class ListHistory {
  int id;
  int userId;
  String uuid;
  String name;
  int red;
  int green;
  int blue;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  ListHistory({
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
  });

  factory ListHistory.fromJson(Map<String, dynamic> json) => ListHistory(
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
      };
}
