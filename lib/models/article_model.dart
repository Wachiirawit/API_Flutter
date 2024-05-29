

class ArticleModel {
  final int id;
  final String title;
  final String description;
  final String date;
  final String image;

  ArticleModel(
      {
      required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.image});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      title: json['title']?? 'No Title',
      description: json['description']?? 'No description',
      date: json['readable_publish_date'] ?? 'No Date',
      image: json['cover_image'] ?? 'https://img.freepik.com/free-vector/hand-drawn-no-data-illustration_23-2150696458.jpg?t=st=1716973659~exp=1716977259~hmac=64a37aac7b397fcc1db20ccdbc9e7836dd681111b7ab1a9f4414e2748d937953&w=740'
    );
  }
}
