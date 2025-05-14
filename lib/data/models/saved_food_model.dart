class SavedFood {
  final int? id;
  final String title;
  int amount;
  final int price;
  final String valyuta;
  final String imageUrl;

  SavedFood({
    this.id,
    required this.title,
    required this.amount,
    required this.price,
    required this.valyuta,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'price': price,
      'valyuta': valyuta,
      'imageUrl': imageUrl,
    };
  }

  factory SavedFood.fromMap(Map<String, dynamic> map) {
    return SavedFood(
      id: map['id'] as int?,
      title: map['title'] as String,
      amount: map['amount'] as int,
      price: map['price'] as int,
      valyuta: map['valyuta'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
