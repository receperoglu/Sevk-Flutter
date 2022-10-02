class OrderFiles {
  int? id;
  String? path;
  int? articelId;
  String? ext;
  String? createdDate;
  String? fileName;
  String? fileType;

  OrderFiles(
      {this.id,
      this.path,
      this.fileType,
      this.articelId,
      this.createdDate,
      this.fileName});

  OrderFiles.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    path = json['Path'];
    fileType = json['Type'];
    articelId = json['ArticelId'];

    createdDate = json['CreatedDate'];
    fileName = json['FileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['Id'] = id;
    data['Path'] = path;
    data["Type"] = fileType;
    data['ArticelId'] = articelId;
    data['CreatedDate'] = createdDate;
    data['FileName'] = fileName;
    return data;
  }
}
