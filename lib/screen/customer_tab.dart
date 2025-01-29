import 'package:flutter/material.dart';
class CustomerTab extends StatefulWidget {
  @override
  _CustomerTabState createState() => _CustomerTabState();
}

class _CustomerTabState extends State<CustomerTab> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Khách hàng'),
      ),
      body: Center(
        child: Text('Khách hàng'),
      ),
    );

  }

}