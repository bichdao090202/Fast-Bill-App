import 'package:fast_bill_app/data/database_helper.dart';
import 'package:fast_bill_app/model/Product.dart';
import 'package:fast_bill_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper = DatabaseHelper();

  await dbHelper.insertProduct(
    Product(id: 1, name: "1m2 nệm thun", note: "", price1: 110),
  );
  await dbHelper.insertProduct(
    Product(id: 2, name: "1m6 viến 12p", note: "", price1: 470),
  );
  await dbHelper.insertProduct(
    Product(id: 3, name: "1m6 gòn 5p", note: "", price1: 240),
  );

  List<Product> products = await dbHelper.getProducts();
  for (var product in products) {
    print('Sản phẩm: ${product.name} - Giá: ${product.price1}');
  }

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastBill',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
