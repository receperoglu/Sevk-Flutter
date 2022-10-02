class WayBill {
  int? id;
  int? weight;
  int? piece;
  String? createdDate;
  int? wayBillId;
  String? color;
  String? dimensions;

  WayBill(
      {this.id,
        this.weight,
        this.piece,
        this.createdDate,
        this.wayBillId,
        this.color,
        this.dimensions});

  WayBill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    weight = json['Weight'];
    piece = json['Piece'];
    createdDate = json['CreatedDate'];
    wayBillId = json['WayBillId'];
    color = json['Color'];
    dimensions = json['Dimensions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] = id;
    data['Weight'] = weight;
    data['Piece'] = piece;
    data['CreatedDate'] = createdDate;
    data['WayBillId'] = wayBillId;
    data['Color'] = color;
    data['Dimensions'] = dimensions;
    return data;
  }
}