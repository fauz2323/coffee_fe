class UploadModel {
  String message;
  String image;
  String dataType;
  int red;
  int green;
  int blue;

  UploadModel({
    required this.message,
    required this.image,
    required this.dataType,
    required this.red,
    required this.green,
    required this.blue,
  });

  factory UploadModel.fromJson(Map<String, dynamic> json) => UploadModel(
        message: json["message"],
        image: json["image"],
        dataType: json["dataType"],
        red: json["red"],
        green: json["green"],
        blue: json["blue"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "image": image,
        "dataType": dataType,
        "red": red,
        "green": green,
        "blue": blue,
      };
}
