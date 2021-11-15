class SimpleRecipe {
  String id;
  String dishImage;
  String title;
  String duration;
  List<String> information;

  SimpleRecipe({
    required this.id,
    required this.dishImage,
    required this.title,
    required this.duration,
    required this.information,
  });

  factory SimpleRecipe.fromJson(Map<String, dynamic> json) {
    return SimpleRecipe(
      id: json['id'] as String, 
      dishImage: json['dishImage'] as String, 
      title: json['title'] as String, 
      duration: json['duration'] as String, 
      information: json['information'].cast<String>() as List<String>
    );
  }
}