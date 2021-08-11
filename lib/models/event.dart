class Event {
  Event({
    required this.type,
    required this.title,
    required this.description,
    required this.organizer,
    required this.startDate,
    required this.endDate,
    required this.website,
    required this.email,
    required this.venue,
    required this.address,
    required this.city,
    required this.country,
    required this.screenshot,
  });

  String type;
  String title;
  String description;
  String organizer;
  DateTime startDate;
  DateTime endDate;
  String website;
  String email;
  String venue;
  String address;
  String city;
  String country;
  String screenshot;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        type: json["type"],
        title: json["title"],
        description: json["description"],
        organizer: json["organizer"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        website: json["website"],
        email: json["email"],
        venue: json["venue"],
        address: json["address"],
        city: json["city"],
        country: json["country"],
        screenshot: json["screenshot"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "description": description,
        "organizer": organizer,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "website": website,
        "email": email,
        "venue": venue,
        "address": address,
        "city": city,
        "country": country,
        "screenshot": screenshot,
      };
}
