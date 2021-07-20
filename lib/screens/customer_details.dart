import 'package:bank_app/screens/modal.dart';
import '../widgets/customcard.dart';
import 'package:flutter/material.dart';

class CustomerDetailsScreen extends StatefulWidget {
  static const routeNamed = '/CustomerDetails';

  @override
  _CustomerDetailsScreenState createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var query = ModalRoute.of(context).settings.arguments as List;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(query[1]),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                "assets/images/customer_hello.jpg",
              ),
            ),
            Text(
              query[1],
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 20,
              thickness: 3,
              endIndent: 0,
            ),
            CustomCard(
              icon: Icons.account_box_outlined,
              title: 'Account No: ${query[0] - 1}',
            ),
            CustomCard(
              icon: Icons.account_balance_wallet_sharp,
              title: 'Balance: Rs.${query[2]}',
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctxt) {
                      return GestureDetector(
                          onTap: () {},
                          child: NewTransaction(
                            customerId: query[0],
                            customerName: query[1],
                            customerBalance: query[2],
                          ),
                          behavior: HitTestBehavior.opaque);
                    });
              },
              child: Text('Transfer Money',
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              style: ElevatedButton.styleFrom(primary: Colors.green[900]),
            )
          ],
        ),
      ),
    );
  }
}
