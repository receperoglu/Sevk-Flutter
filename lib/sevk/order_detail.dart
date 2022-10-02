import 'package:com_hello_world/sevk/helperUi/modal_picture.dart';
import 'package:com_hello_world/sevk/models/Articles.dart';
import 'package:com_hello_world/sevk/models/Order.dart';
import 'package:com_hello_world/sevk/models/OrderFiles.dart';
import 'package:flutter/material.dart';
import '../size.dart';
import 'OrderEdit.dart';
import 'helperUi/checkImgUrl.dart';
import 'helperUi/dateFormat.dart';
import 'helperUi/waitData.dart';
import 'models/WayBill.dart';
import 'services/HttpService.dart';
import 'helperUi/blueColor.dart';

class OrderDetail extends StatelessWidget {
  final Articles articles;
  const OrderDetail({Key? key, required this.articles}) : super(key: key);

  Future<List> getDetail() async {
    var a = await HttpService()
        .getApi("FindArticelOrders/${articles.id.toString()}");
    List b = a.map((dynamic item) => Order.fromJson(item)).toList();
    return b;
  }

  Future<List> getFiles() async {
    var a = await HttpService()
        .getApi("FindArticelPictures/${articles.id.toString()}");
    List b = a.map((dynamic item) => OrderFiles.fromJson(item)).toList();
    return b;
  }

  Future<List> getWaybills() async {
    var a = await HttpService()
        .getApi("FindArticelWayBills/${articles.id.toString()}");
    List b = a.map((dynamic item) => WayBill.fromJson(item)).toList();
    return b;
  }

  Future<List> getOrderWaybills(orderId) async {
    var a = await HttpService().getApi("FindOrderWayBills/$orderId");
    List b = a.map((dynamic item) => WayBill.fromJson(item)).toList();
    return b;
  }

  orderDetailTitle(item) {
    return "${item.piece} ${item.metrics} ${item.dimensions} ${item.color.toString()}";
  }

  getWaybillTxt(item) {
    return "${item.piece} Ad ${item.weight} KG ${item.dimensions} ${item.color} ";
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: blueColor,
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.list_alt_outlined)),
              Tab(icon: Icon(Icons.file_present)),
              Tab(icon: Icon(Icons.local_shipping_sharp))
            ]),
            title: Row(children: [
              Text(
                "${articles.articelName} ${articles.customerName} ",
                style: const TextStyle(fontSize: 16),
              )
            ]),
          ),
          body: TabBarView(
            children: [
              FutureBuilder(
                future: getDetail(),
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (ctx, index) => Card(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: SizeConfig.width * 0.8,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  primary: Colors.black),
                                              onPressed: () => {
                                                showAlertDialog(
                                                    context,
                                                    snapshot.data[index].id
                                                        .toString(),
                                                    snapshot.data[index])
                                              },
                                              child: Text(
                                                orderDetailTitle(
                                                    snapshot.data[index]),
                                                style: const TextStyle(
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                              icon: const Icon(Icons.edit,
                                                  color: blueColor),
                                              onPressed: () => {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                OrderEdit(
                                                                    detail: snapshot
                                                                            .data[
                                                                        index])))
                                                  })
                                        ],
                                      ),
                                    ]),
                              ),
                            ));
                  } else {
                    return waitData();
                  }
                },
              ),
              FutureBuilder(
                future: getFiles(),
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, index) => Card(
                        child: ListTile(
                          leading: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ModalPicture(
                                      pictureUrl: snapshot.data[index])));
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  checkImgUrl(snapshot.data[index]),
                                  scale: 0.6),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          title: Text(snapshot.data[index].path.toString(),
                              style: const TextStyle(fontSize: 12)),
                          contentPadding: const EdgeInsets.all(5.0),
                        ),
                      ),
                    );
                  } else {
                    return waitData();
                  }
                },
              ),
              FutureBuilder(
                future: getWaybills(),
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, index) => Card(
                        child: ListTile(
                          leading: Text(getWaybillTxt(snapshot.data[index]),
                              style: const TextStyle(fontSize: 12)),
                          contentPadding: const EdgeInsets.all(5.0),
                        ),
                      ),
                    );
                  } else {
                    return waitData();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, orderId, articel) {
    Widget okButton = FlatButton(
      child: const Icon(
        Icons.close,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    showDialog(
      barrierColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.height * 0.1,
              child: Container(
                decoration: const BoxDecoration(color: blueColor),
                width: SizeConfig.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: SizeConfig.width * 0.8,
                        child: Text(orderDetailTitle(articel),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ))),
                    SizedBox(
                      width: SizeConfig.width * 0.2,
                      child: okButton,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.height * 0.8,
              child: FutureBuilder(
                future: getOrderWaybills(orderId),
                builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, index) => Card(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: getorderWaybillText(snapshot.data[index]),
                        ),
                      ),
                    );
                  } else {
                    return waitData();
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }

  getorderWaybillText(item) {
    return SizedBox(
      width: SizeConfig.width - 10,
      child: Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: SizeConfig.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${item.piece} Ad ${item.weight} KG",
                        style: const TextStyle(fontSize: 14)),
                    Text(
                      " ${getFormat(item.createdDate)}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: SizeConfig.width * 0.1,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.document_scanner),
                  color: blueColor,
                  padding: EdgeInsets.zero,
                ),
              )
            ]),
      ),
    );
  }
}
