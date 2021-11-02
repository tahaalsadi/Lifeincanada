class Plist{
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String itemCount;

Plist({
  required   this.id,
  required   this.title,
  required   this.description,
  required   this.thumbnailUrl, 
  required   this.itemCount,
  });

factory Plist.fromMap(Map<String, dynamic> items) {
    return Plist(
      id: items['id'],
      title: items['snippet']['title'],
      description: items['snippet']['description'],
      thumbnailUrl:items ['snippet']['thumbnails']['high']['url'],
      itemCount:items ['snippet']['contentDetails']['itemCount'],

    );
  }
}