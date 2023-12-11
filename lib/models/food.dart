class Food {
  String name;
  String price;
  String imagepath;
  String rating;
  String Description;

  Food(
      {required this.name,
      required this.imagepath,
      required this.price,
      required this.rating,
      required this.Description});

  String get _name => name;
  String get _price => price;
  String get _imagepath => imagepath;
  String get _rating => rating;
}
