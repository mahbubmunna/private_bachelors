import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:privatebachelors/configs/padding.dart';

class FoodBillPage extends StatefulWidget {
  @override
  _FoodBillPageState createState() => _FoodBillPageState();
}

class _FoodBillPageState extends State<FoodBillPage> {
  String _monthYearDate = DateFormat.yMMMd().format(DateTime.now());
  void _addItemPrompt() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(left: 50, right: 50, top: padding16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(padding16)
            ),
            title: Text('Add Items to the list'),
            content: _dialogContent(),
            actions: <Widget>[
              FlatButton(
                onPressed: (){},
                child: Text('Clear'),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text('Add'),
              ),

            ],
          );
        });
  }

  Widget _dialogContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              hintText: 'Select Item',
            suffixIcon: IconButton(
              icon: Icon(Icons.arrow_downward),
              onPressed: (){},
            )
          ),
        ),
        SizedBox(height: padding16,),
        TextField(
          decoration: InputDecoration(
            hintText: _monthYearDate
          ),
        ),
        SizedBox(height: padding16,),
        TextField(
          decoration: InputDecoration(
              hintText: 'Amount'
          ),
        ),

      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addItemPrompt,
        child: Icon(Icons.add),
      ),

    );
  }
}

