class Order {
  String? dimensions;
  String? productTypeName;
  String? color;
  int? piece;
  int? id;
  int? typeid;
  int? corpId;
  String? createdDate;
  String? saleTypeName;
  String? metrics;
  String? saleTypeId;

  Order({
    this.dimensions,
    this.productTypeName,
    this.color,
    this.piece,
    this.corpId,
    this.createdDate,
    this.saleTypeName,
    this.metrics,
    this.id,
  });

  Order.fromJson(Map<String, dynamic> json) {
    dimensions = json['Dimensions'];
    productTypeName = json['ProductTypeName'];
    color = json['Color'];
    piece = json['Piece'];
    corpId = json['CorpId'];
    createdDate = json['CreatedDate'];
    saleTypeName = json['SaleTypeName'];
    metrics = json['Metrics'];
    id = json['OrderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Dimensions'] =dimensions;
    data['ProductTypeName'] =productTypeName;
    data['Color'] =color;
    data['Piece'] =piece;
    data['CorpId'] =corpId;
    data['CreatedDate'] =createdDate;
    data['SaleTypeName'] =saleTypeName;
    data['Metrics'] =metrics;
    data["OrderId"]=id;
    return data;
  }
}
