class OrderFiles {
  int? id;
  String? path;
  String? type;
  String? articelId;
  Null? orderId;
  String? fileName;
  String? ext;
  String? createdDate;

  OrderFiles(
      {this.id,
      this.path,
      this.type,
      this.articelId,
      this.orderId,
      this.fileName,
      this.ext,
      this.createdDate});

  OrderFiles.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    path = json['Path'];
    type = json['Type'];
    articelId = json['ArticelId'];
    orderId = json['OrderId'];
    fileName = json['FileName'];
    ext = json['ext'];
    createdDate = json['CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Path'] = this.path;
    data['Type'] = this.type;
    data['ArticelId'] = this.articelId;
    data['OrderId'] = this.orderId;
    data['FileName'] = this.fileName;
    data['ext'] = this.ext;
    data['CreatedDate'] = this.createdDate;
    return data;
  }
}
