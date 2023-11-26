class Question {
  String answer;
  String question;
  String url;
  List<String> tags;

  Question({
    required this.answer,
    required this.question,
    required this.url,
    required this.tags,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    answer: json["answer"],
    question: json["question"],
    url: json["url"],
    tags: List<String>.from(json["tags"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "question": question,
    "url": url,
    "tags": List<dynamic>.from(tags.map((x) => x)),
  };
}