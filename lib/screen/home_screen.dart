import 'package:fast_bill_app/screen/customer_tab.dart';
import 'package:fast_bill_app/screen/order_tab.dart';
import 'package:fast_bill_app/screen/product_tab.dart';
import 'package:fast_bill_app/screen/setting_tab.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: ProductTab()),
    Center(child: OrderTab()),
    Center(child: CustomerTab()),
    Center(child: SettingTab()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; //
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bed_sharp),
            label: 'Sản phẩm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_note),
            label: 'Hóa đơn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Khách hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF1C3988),
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }
}