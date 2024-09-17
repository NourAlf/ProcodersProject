class Task {
  String title;
  String content ;
  Task({required this .content, required this .title});
  // Convert Note to Map for storage
  Map<String, dynamic> toJson() => {'title': title, 'content': content};

  // Convert Map to Note object
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'] ?? "",
      content: json['content'] ?? "",
    );
  }
}

