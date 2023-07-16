class Order {
  int? id;
  String? articelId;
  String? corpId;
  String? dimensions;
  String? productTypeName;
  String? color;
  String? piece;
  String? createdDate;
  String? saleTypeName;
  String? metrics;
  String? saleTypeId;

  Order(
      {this.id,
      this.articelId,
      this.corpId,
      this.dimensions,
      this.productTypeName,
      this.color,
      this.piece,
      this.createdDate,
      this.saleTypeName,
      this.metrics,
      this.saleTypeId});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articelId = json['ArticelId'];
    corpId = json['CorpId'];
    dimensions = json['Dimensions'];
    productTypeName = json['ProductTypeName'];
    color = json['Color'];
    piece = json['Piece'];
    createdDate = json['CreatedDate'];
    saleTypeName = json['SaleTypeName'];
    metrics = json['Metrics'];
    saleTypeId = json['SaleTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ArticelId'] = this.articelId;
    data['CorpId'] = this.corpId;
    data['Dimensions'] = this.dimensions;
    data['ProductTypeName'] = this.productTypeName;
    data['Color'] = this.color;
    data['Piece'] = this.piece;
    data['CreatedDate'] = this.createdDate;
    data['SaleTypeName'] = this.saleTypeName;
    data['Metrics'] = this.metrics;
    data['SaleTypeId'] = this.saleTypeId;
    return data;
  }
}
