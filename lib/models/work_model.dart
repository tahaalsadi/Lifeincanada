class Workk {
  String ? imageUrl;
  String  title;
  String  content;
  // ignore: non_constant_identifier_names
  String  author_info;
  String  date;

  // ignore: non_constant_identifier_names
  Workk({ this.imageUrl,required this.title, required this.content, required this.author_info, required this.date});

  factory Workk.fromJson(Map<String, dynamic> json) {
    return Workk(
      imageUrl: json['featured_image_src']??  'assets/images/loadercyan.gif',
      title: json['title']['rendered'] as String,
      content: json['content']['rendered'] as String,
      author_info: json['author_info']['display_name'] as String,
      date: json['date'] as String,
    );
  }
}