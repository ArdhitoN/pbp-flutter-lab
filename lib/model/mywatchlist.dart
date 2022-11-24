import 'dart:convert';

List<MyWatchList> toDoFromJson(String str) =>
    List<MyWatchList>.from(json.decode(str).map((x) => MyWatchList.fromJson(x)));

String toDoToJson(List<MyWatchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// title = models.CharField(max_length=255)
// rating = models.DecimalField(max_digits=3, decimal_places=2, validators= [MinValueValidator(1) ,MaxValueValidator(5)])
// release_date = models.DateField()
// review = models.TextField()
// is_watched = models.BooleanField()

class MyWatchList {
  MyWatchList({
    required this.title,
    required this.rating,
    required this.release_date,
    required this.review,
    required this.is_watched,
  });

  String title;
  String rating;
  String release_date;
  String review;
  bool is_watched;

  factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
        title: json["fields"]["title"],
        rating: json["fields"]["rating"],
        release_date: json["fields"]["release_date"],
        review: json["fields"]["review"],
        is_watched: json["fields"]["is_watched"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "rating": rating,
        "release_date": release_date,
        "review": review,
        "is_watched": is_watched,
      };
}
