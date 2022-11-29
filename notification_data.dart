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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    data['created'] = date;
    return data;
  }
}