import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:privatebachelors/configs/padding.dart';

class DiningBillPage extends StatefulWidget {
  @override
  _DiningBillPageState createState() => _DiningBillPageState();
}

class _DiningBillPageState extends State<DiningBillPage> {
  GlobalKey<FormState> _addDiningBillKey = new GlobalKey<FormState>();
  final amountController = TextEditingController();
  String _type = 'All';
  int _amount = 0;

  String _monthYearDate = DateFormat.yMMMd().format(DateTime.now());
  DateTime _dateTime = DateTime.now();

  void _addItemPrompt() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            titlePadding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(padding16)),
            title: Row(
              children: <Widget>[
                Icon(Icons.add_circle_outline),
                SizedBox(width: 10),
                Text(
                  'Add Dining Bill',
                  style: Theme.of(context).textTheme.body2,
                )
              ],
            ),
            children: <Widget>[
              Form(
                key: _addDiningBillKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Theme.of(context).hintColor),
                      decoration: getInputDecoration(
                          hintText: '475', labelText: 'Amount'),
                      onSaved: (input) => setState(() {
                        _amount = int.parse(input);
                      }),
                    ),
                    FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return DateTimeField(
                          decoration: getInputDecoration(
                              hintText: '1996-12-31', labelText: 'Date'),
                          format: new DateFormat('yyyy-MM-dd'),
                          initialValue: _dateTime,
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
                          onSaved: (input) => setState(() {
                            _dateTime = input;
                          }),
                        );
                      },
                    ),
                    FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return DropdownButtonFormField<String>(
                          decoration: getInputDecoration(
                              hintText: 'All', labelText: 'Type'),
                          hint: Text('Select type'),
                          value: _type,
                          onChanged: (input) {
                            setState(() {
                              _type = input;
                            });
                          },
                          onSaved: (input) => _type = input,
                          items: <DropdownMenuItem<String>>[
                            DropdownMenuItem(
                              value: 'All',
                              child: Text('All'),
                            ),
                            DropdownMenuItem(
                              value: 'Snacks',
                              child: Text('Snacks'),
                            ),
                            DropdownMenuItem(
                              value: 'Rice',
                              child: Text('Rice'),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        MaterialButton(
                          onPressed: _submit,
                          child: Text(
                            'Save',
                            style: TextStyle(color: Theme.of(context).accentColor),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              )
            ],
          );
        });
  }

  InputDecoration getInputDecoration({String hintText, String labelText}) {
    return new InputDecoration(
      hintText: hintText,
      labelText: labelText,
      hintStyle: Theme.of(context).textTheme.body1.merge(
            TextStyle(color: Theme.of(context).focusColor),
          ),
      enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).hintColor.withOpacity(0.2))),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hintColor)),
      hasFloatingPlaceholder: true,
      labelStyle: Theme.of(context).textTheme.body1.merge(
            TextStyle(color: Theme.of(context).hintColor),
          ),
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

  void _submit() async {
  }
}
