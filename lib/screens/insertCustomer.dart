import '../model/customer.dart';
import 'package:flutter/material.dart';
import '../dbHelper.dart';

class InsertCustomer extends StatefulWidget {
  static const routeNamed = '/transactionDetails';

  @override
  _InsertCustomerState createState() => _InsertCustomerState();
}

class _InsertCustomerState extends State<InsertCustomer> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  String _customerName = '';
  double _customerBalance = 0.0;

  final _employeeNameController = TextEditingController();
  final _employeeBalanceController = TextEditingController();

  DBHelper db;

  @override
  void initState() {
    db = DBHelper();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(
          'Add Customer',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Form(
                key: _formStateKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        onSaved: (value) {
                          _customerName = value;
                        },
                        keyboardType: TextInputType.name,
                        controller: _employeeNameController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          focusedBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.black12,
                                  width: 2,
                                  style: BorderStyle.solid)),
                          labelText: "Name",
                          fillColor: Colors.black,
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        onSaved: (value) {
                          _customerBalance = double.parse(value);
                        },
                        keyboardType: TextInputType.name,
                        controller: _employeeBalanceController,
                        decoration: InputDecoration(
                          focusedBorder: new UnderlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                  style: BorderStyle.solid)),
                          labelText: "Intial Balance",
                          fillColor: Colors.black,
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20, height: 50),
              RaisedButton(
                onPressed: () async {
                  _formStateKey.currentState.save();
                  db.insertCustomer(Customer(
                      id: null,
                      name: _customerName,
                      balance: _customerBalance));
                  _employeeNameController.text = '';
                  _employeeBalanceController.text = 0.0.toString();
                },
                color: Colors.green[900],
                child: Text('ADD', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
