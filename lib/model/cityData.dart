class City{
  final int id;
  final String name;
  final String imgUrl;
  final bool ispopular;

  City({
    required this.id, 
    required this.name, 
    required this.imgUrl,
    this.ispopular = false});
}