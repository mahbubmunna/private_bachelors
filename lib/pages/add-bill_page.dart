import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:privatebachelors/pages/add_bill_sub/food-bill_page.dart';
import 'package:privatebachelors/pages/add_bill_sub/others-bill_page.dart';

class AddBillPage extends StatefulWidget {
  @override
  _AddBillPageState createState() => _AddBillPageState();
}

class _AddBillPageState extends State<AddBillPage> {
  String _monthYear = DateFormat.yMMM().format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.orangeAccent]),
            ),
          ),
          title: Text(_monthYear),
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("DINNING"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("OTHERS"),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          children: <Widget>[
            FoodBillPage(),
            OthersBillPage(),
          ],
        ),

      ),
    );
  }
}
