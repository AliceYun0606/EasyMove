class NotificationData {
  late String title;
  late String message;
  late String date;

  NotificationData({required this.title, required this.message, required this.date});

  NotificationData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    date = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['message'] = this.message;
    data['created'] = this.date;
    return data;
  }
}