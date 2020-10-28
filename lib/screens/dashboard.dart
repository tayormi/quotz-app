import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$count',
                style: TextStyle(fontSize: 30),
              ),
              FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Text('Increment Number'))
            ],
          ),
        ),
      ),
    );
  }
}
