class Tresut {
  String imageUrl;
  String title;
  String content;
  String author_info;
  String date;

  Tresut(
      {required this.imageUrl,required  this.title, required this.content,required  this.author_info, required this.date});

  factory Tresut.fromJson(Map<String, dynamic> json) {
    return Tresut(
      imageUrl: json['featured_image_src']??  'assets/images/loadercyan.gif',
      title: json['title']['rendered'] as String,
      content: json['content']['rendered'] as String,
      author_info: json['author_info']['display_name'] as String,
      date: json['date'] as String,
    );
  }
}