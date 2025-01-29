import 'package:flutter/material.dart';
class OrderTab extends StatefulWidget {
  @override
  _OrderTabState createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Hóa đơn'),
      ),
      body: Center(
        child: Text('Hóa đơn'),
      ),
    );

  }

}