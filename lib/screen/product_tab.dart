import 'dart:io';

import 'package:excel/excel.dart';
import 'package:fast_bill_app/data/database_helper.dart';
import 'package:fast_bill_app/model/Product.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProductTab extends StatefulWidget {
  @override
  _ProductTabState createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  List<Product> products = [];
  final dbHelper = DatabaseHelper(); // Sử dụng singleton đã tạo

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final loadedProducts = await dbHelper.getProducts();
    setState(() {
      products = loadedProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sản phẩm'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Import',
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['xlsx'],
                );

                if (result != null) {
                  File file = File(result.files.single.path!);
                  var bytes = file.readAsBytesSync();
                  var excel = Excel.decodeBytes(bytes);

                  List<Product> productList = [];

                  for (var table in excel.tables.keys) {
                    var sheet = excel.tables[table];

                    for (var row in sheet!.rows.skip(1)) { // Bỏ qua dòng tiêu đề
                      try {
                        int id = int.tryParse(row[0]?.value.toString() ?? '0') ?? 0;
                        String name = row[1]?.value.toString() ?? '';
                        String note = row[2]?.value.toString() ?? '';
                        int price1 = int.tryParse(row[3]?.value.toString() ?? '0') ?? 0;

                        if (name.isNotEmpty) {
                          Product product = Product(id: id, name: name, note: note, price1: price1);
                          print(product);
                          productList.add(product);
                        }
                      } catch (e) {
                        print("Lỗi đọc dòng Excel: $e");
                      }
                    }
                  }

                  for (var product in productList) {
                    await DatabaseHelper().insertProduct(product);
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${productList.length} sản phẩm đã được nhập!')),
                  );

                  loadProducts();

                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.save_alt),
              tooltip: 'Export',
              onPressed: () {},
            ),
          ],
        ),
        body: Column(children: [
          Text("Danh sách sản phẩm"),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].name),
                  subtitle: Text('Giá: ${products[index].price1} VNĐ'),
                );
              },
            ),
          )
        ]));
  }
}
