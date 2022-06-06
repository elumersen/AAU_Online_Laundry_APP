class Cloth{
  String name;
  double price;
  Cloth({required this.name,required this.price});

  factory Cloth.fromJson(jsonData){
    print("***************1");
    return Cloth(name: jsonData["name"], price: jsonData["price"]);
  }

  Map<String, Object?> toMap() {
    return {"name":this.name,"price":this.price};
  }
}