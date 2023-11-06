class MenuItem {
  int? id;
  final String? title;
  final String? description;
  final int? stock;
  final double? price;
  final String? imgUrl;

  MenuItem(
      {this.id,
      this.title,
      this.description,
      this.stock,
      this.price,
      this.imgUrl});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      stock: json['stock'] as int?,
      price: json['price'] as double?,
      imgUrl: json['imgUrl'] as String?,
    );
  }

  @override
  String toString() {
    return '{"id":$id,"title":"$title","description":"$description","stock":$stock,"price":$price}';
  }
}
