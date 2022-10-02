
class Articles {
  int? id;
  int? saleType;
  int? corpId;
  String? articelName;
  String? customerName;
  String? createdDate;

  Articles(
      {this.id,
        this.saleType,
        this.corpId,
        this.articelName,
        this.customerName,
        this.createdDate
      });

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['ArticelId'];
    saleType = json['SaleType'];
    corpId = json['CorpId'];
    articelName = json['ArticelName'];
    customerName = json['CustomerName'];
    createdDate = json['CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ArticelId'] =this.id;
    data['SaleType'] =this.saleType;
    data['CorpId'] =this.corpId;
    data['ArticelName'] =this.articelName;
    data['CustomerName'] =this.customerName;
    data['CreatedDate'] =this.createdDate;


    return data;
  }
}
