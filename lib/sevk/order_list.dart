import 'package:com_hello_world/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/orderList.dart';
import 'helperUi/dateFormat.dart';
import 'helperUi/text_style.dart';
import 'helperUi/waitData.dart';
import 'order_detail.dart';

class OrderList extends GetWidget<OrderListController> {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final orderListcontroller = Get.put(OrderListController());
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: FutureBuilder(
          future: orderListcontroller.getArticles(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: orderListcontroller.articelList.length,
                  itemBuilder: (ctx, index) =>
                      orderItem(ctx, snapshot.data[index]));
            }
            if (orderListcontroller.isLoading) {
              return waitData();
            }
            return const SizedBox();
          }),
    );
  }
}

GestureDetector orderItem(context, articel) {
  return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: SizeConfig.width * 0.8,
                        child: Text(articel.articelName,
                            style: CustomTextStyle.head)),
                    Text(articel.customerName),
                    Text(getFormat(articel.createdDate)),
                  ],
                ),
              ),
              const Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OrderDetail(articles: articel)));
      });
}
