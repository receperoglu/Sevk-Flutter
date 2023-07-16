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
    var a = await HttpService().getApi("OrderDetail/${articles.id.toString()}");
    List b = a.map((dynamic item) => Order.fromJson(item)).toList();
    return b;
  }

  Future<List> getFiles() async {
    var a = await HttpService().getApi("files/${articles.id.toString()}");
    List b = a.map((dynamic item) => OrderFiles.fromJson(item)).toList();
    return b;
  }

  Future<List> getWaybills() async {
    var a = await HttpService().getApi("multimotion/${articles.id.toString()}");
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
              tabDetail(context),
              tabFiles(context),
              tabWayBill(),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<dynamic>> tabWayBill() {
    return FutureBuilder(
      future: getWaybills(),
      builder: (BuildContext ctx, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          List<dynamic> wayBills = snapshot.data!;
          return ListView.builder(
            itemCount: wayBills.length,
            itemBuilder: (ctx, index) {
              dynamic wayBill = wayBills[index];
              return Card(
                child: ListTile(
                  leading: Text(
                    "${wayBill.sendEdPiece} Ad ${wayBill.weight} KG ${wayBill.dimensions} ${wayBill.color} ",
                    style: const TextStyle(fontSize: 12),
                  ),
                  contentPadding: const EdgeInsets.all(5.0),
                ),
              );
            },
          );
        } else {
          return waitData();
        }
      },
    );
  }

  FutureBuilder<List<dynamic>> tabFiles(BuildContext context) {
    return FutureBuilder(
      future: getFiles(),
      builder: (BuildContext ctx, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          List<dynamic> files = snapshot.data!;
          return ListView.builder(
            itemCount: files.length,
            itemBuilder: (ctx, index) {
              dynamic file = files[index]; // Ayrı bir değişken tanımlanıyor

              return Card(
                child: ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ModalPicture(pictureUrl: file),
                      ));
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        checkImgUrl(file),
                        scale: 0.6,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  title: Text(
                    file.path.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                  contentPadding: const EdgeInsets.all(5.0),
                ),
              );
            },
          );
        } else {
          return waitData();
        }
      },
    );
  }

  FutureBuilder<List<dynamic>> tabDetail(BuildContext context) {
    return FutureBuilder(
      future: getDetail(),
      builder: (BuildContext ctx, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SkeletonWidget(
                        height: 40,
                        width: SizeConfig.width * 0.8,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      SkeletonWidget(
                        height: 40,
                        width: 30,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasData) {
          List<dynamic> details = snapshot.data!;
          return ListView.builder(
            itemCount: details.length,
            itemBuilder: (ctx, index) {
              dynamic detail = details[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: SizeConfig.width * 0.8,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                alignment: Alignment.centerLeft,
                              ),
                              onPressed: () => {
                                showAlertDialog(
                                  context,
                                  detail.id.toString(),
                                  detail,
                                )
                              },
                              child: Text(
                                orderDetailTitle(detail),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: blueColor,
                            ),
                            onPressed: () => {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => OrderEdit(
                                    detail: detail,
                                  ),
                                ),
                              ),
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox(); // Hata durumunda hiçbir şey görüntüleme
        }
      },
    );
  }

  showAlertDialog(BuildContext context, orderId, articel) {
    Widget okButton = IconButton(
      icon: const Icon(
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
        return AlertDialog(
          backgroundColor: blueColor,
          title: Text(
            orderDetailTitle(articel),
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          actions: [
            okButton,
          ],
          content: SizedBox(
            height: SizeConfig.height * 0.8,
            child: FutureBuilder(
              future: getOrderWaybills(orderId),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
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
        );
      },
    );
  }

  getorderWaybillText(item) {
    return SizedBox(
      width: SizeConfig.width - 10,
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
                  Text("${item.sendEdPiece} Ad ${item.weight} KG",
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
    );
  }
}

class SkeletonWidget extends StatefulWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final BorderRadius borderRadius;

  const SkeletonWidget({
    Key? key,
    required this.height,
    required this.width,
    this.margin = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  _SkeletonWidgetState createState() => _SkeletonWidgetState();
}

class _SkeletonWidgetState extends State<SkeletonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
    _animation = ColorTween(
      begin: Colors.grey[300],
      end: Colors.grey[400],
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          height: widget.height,
          width: widget.width,
          margin: widget.margin,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            gradient: LinearGradient(
              colors: [
                _animation.value!,
                _animation.value!,
                _animation.value!,
              ],
            ),
          ),
        );
      },
    );
  }
}
