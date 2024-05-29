class CryptoModel {

  final String id;
  final String name;
  final double price;
  final String image;


  CryptoModel(
      {
      required this.id,
      required this.name,
      required this.price,
      required this.image});
      

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
        id: json['id'],
        name: json['name'],
        price: (json['current_price'] as num).toDouble(), 
        // price: (json['current_price']as double).toInt(), 
        image: json['image'] ?? 'https://img.freepik.com/free-vector/earnings_53876-36666.jpg?t=st=1716909175~exp=1716912775~hmac=44854e1abde6424f2173b424b5dc6a2fc630236daaad4dde5b26b277cd9887de&w=740');
  }
}
