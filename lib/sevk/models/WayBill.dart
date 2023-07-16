class WayBill {
  String? id;
  int? wayBillId;
  String? corpId;
  Null? corpName;
  String? articelId;
  Null? articelName;
  String? dimensions;
  String? productTypeName;
  String? color;
  String? weight;
  Null? reelPiece;
  String? sendEdPiece;
  String? orderId;
  String? createdDate;
  Null? saleTypeName;
  Null? metrics;
  Null? saleTypeId;

  WayBill(
      {this.id,
      this.wayBillId,
      this.corpId,
      this.corpName,
      this.articelId,
      this.articelName,
      this.dimensions,
      this.productTypeName,
      this.color,
      this.weight,
      this.reelPiece,
      this.sendEdPiece,
      this.orderId,
      this.createdDate,
      this.saleTypeName,
      this.metrics,
      this.saleTypeId});

  WayBill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wayBillId = json['WayBillId'];
    corpId = json['CorpId'];
    corpName = json['CorpName'];
    articelId = json['ArticelId'];
    articelName = json['ArticelName'];
    dimensions = json['Dimensions'];
    productTypeName = json['ProductTypeName'];
    color = json['Color'];
    weight = json['Weight'];
    reelPiece = json['ReelPiece'];
    sendEdPiece = json['SendEdPiece'];
    orderId = json['OrderId'];
    createdDate = json['CreatedDate'];
    saleTypeName = json['SaleTypeName'];
    metrics = json['Metrics'];
    saleTypeId = json['SaleTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['WayBillId'] = this.wayBillId;
    data['CorpId'] = this.corpId;
    data['CorpName'] = this.corpName;
    data['ArticelId'] = this.articelId;
    data['ArticelName'] = this.articelName;
    data['Dimensions'] = this.dimensions;
    data['ProductTypeName'] = this.productTypeName;
    data['Color'] = this.color;
    data['Weight'] = this.weight;
    data['ReelPiece'] = this.reelPiece;
    data['SendEdPiece'] = this.sendEdPiece;
    data['OrderId'] = this.orderId;
    data['CreatedDate'] = this.createdDate;
    data['SaleTypeName'] = this.saleTypeName;
    data['Metrics'] = this.metrics;
    data['SaleTypeId'] = this.saleTypeId;
    return data;
  }
}
