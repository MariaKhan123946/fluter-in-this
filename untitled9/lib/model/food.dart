class Food {
  final String _name;
  final String _price;
  final String _imagePath;
  final String _rating;

  Food({
    required String name,
    required String price,
    required String imagePath,
    required String rating,
  })   : _name = name,
        _price = price,
        _imagePath = imagePath,
        _rating = rating;

  String get name => _name;
  String get price => _price;
  String get imagePath => _imagePath;
  String get rating => _rating;
}
