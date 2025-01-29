class Product {
   int id;
   String name;
   String note;
   int price1;
   // int? price2;
   // int? price3;
   // int? price4;
   // int? price5;

  Product({
    required this.id,
    required this.name,
    required this.note,
    required this.price1,
     // this.price2,
     // this.price3,
     // this.price4,
     // this.price5,
  });

  Map <String, Object> toMap(){
    return {
      'id': id,
      'name': name,
      'note': note,
      'price1': price1,
      // 'price2': price2,
      // 'price3': price3,
      // 'price4': price4,
      // 'price5': price5,
    };
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, note: $note, price1: $price1}';
  }
}