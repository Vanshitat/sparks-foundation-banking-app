import 'package:bank_app/model/customer.dart';
import 'package:bank_app/screens/customers_list.dart';
import 'package:bank_app/screens/insertCustomer.dart';
import 'package:bank_app/widgets/customcard.dart';
import 'package:flutter/material.dart';
import '../dbHelper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Customer> query = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Banking App', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/bank_img2.jpg"),
                height: 450,
                width: 450,
                fit: BoxFit.fitHeight,
              ),
              CustomCard(
                icon: Icons.account_circle,
                title: 'View All Customers',
                navpage: () async {
                  DBHelper db = DBHelper();
                  query = await db.getCustomer();
                  Navigator.of(context)
                      .pushNamed(CustomersList.routeNamed, arguments: query);
                },
              ),
              CustomCard(
                icon: Icons.account_balance_rounded,
                title: 'Add a New Customer',
                navpage: () {
                  Navigator.of(context).pushNamed(
                    InsertCustomer.routeNamed,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
