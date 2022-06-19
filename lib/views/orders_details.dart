import 'package:flutter/material.dart';
import 'package:fuseapp/providers/ordersprovider.dart';

import '../theme/theme_constants.dart';
import '../view_model/orders_vm.dart';

class OrderDetatils extends StatefulWidget {
  final OrdersInfo obj;
  int index;
  OrderDetatils(this.obj, this.index);

  @override
  State<OrderDetatils> createState() => _OrderDetatilsState();
}

class _OrderDetatilsState extends State<OrderDetatils> {
  @override
  Widget build(BuildContext context) {
    print('test ${widget.obj.tax}');
    return Scaffold(
        appBar: myAppBar(context, title: 'Order Detatils '),
        body: new Container(
            alignment: Alignment.center,
            child: Column(children: [

              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                discription("Order No.", widget.obj.orderno??'', h7, h7),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  discription("Date",  widget.obj.date??'', h7, h7),
                ],
              ),
              Container(
                height: 420,
                child: _orderslistView(widget.obj),
              ),
              Container(child: ordersTotal(widget.obj))
            ])));
  }
}

Row discription(String label, String orderdet, TextStyle y, TextStyle h) {
  return Row(children: [
    Text(label, style: y),
    SizedBox(width: 20),
    Text(orderdet, style: h),
  ]);
}

Row discription2(String label, String orderdet, TextStyle y, TextStyle h) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Text(label, style: y),
    SizedBox(width: 10),
    Text(orderdet, style: h),
  ]);
}

Widget _orderslistView(OrdersInfo obj) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    padding: new EdgeInsets.only(left: 0.0, bottom: 8.0, right: 16.0),
    itemCount: obj.items!.length,
    itemBuilder: (BuildContext context, int index) {
      return Material(
        color: Colors.transparent,
        shape:
            RoundedRectangleBorder(side: BorderSide(color: Colors.transparent)),
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(7.0),
              child: discription("Item Name", obj.items![index].item_name??'', h5, h7),
            ),
            new Padding(
              padding: new EdgeInsets.all(7.0),
              child: discription("Item No.", obj.items![index].item_no??'', h5, h7),
            ),
                  Row (
              mainAxisAlignment: MainAxisAlignment.end,
              children : [  
                new Padding(
              padding: new EdgeInsets.all(0.0),
              child: 
 Image.network(obj.items![index].img??"", height:200,
    width: 200,),
             
            ),]
            ),
            new Padding(
                padding: new EdgeInsets.all(7.0),
                child: discription("Quantity", obj.items![index].quantity??'', h5, h7)),
            new Padding(
                padding: new EdgeInsets.all(7.0),
                child: discription("Price", obj.items![index].price??'', h5, h7)),
            Divider(
              color: GREY,
              height: 10.0,
            ),
          ],
        ),
      );
    },
  );
}

Material ordersTotal(OrdersInfo obj) {
  return Material(
    color: Colors.transparent,
    child: new Column(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.all(7.0),
          child: discription2(
              "Total",
              (obj.amount??0 - (obj.shipping??0 + obj.tax!))
                  .toString(),
              h7,
              h7),
        ),
        new Padding(
          padding: new EdgeInsets.all(7.0),
          child:
              discription2("Shipping", obj.shipping.toString(), h7, h7),
        ),
        new Padding(
          padding: new EdgeInsets.all(7.0),
          child: discription2("Tax", obj.tax.toString(), h7, h7),
        ),
        new Padding(
          padding: new EdgeInsets.all(7.0),
          child: discription2(
              "Total Amount", obj.amount.toString(), h4, h4),
        ),
      ],
    ),
  );
}
