import 'package:flutter/material.dart';
class ProductTab extends StatefulWidget {
  @override
  _ProductTabState createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Sản phẩm'),
      ),
      body: Center(
        child: Text('Sản phẩm'),
      ),
    );

  }

}