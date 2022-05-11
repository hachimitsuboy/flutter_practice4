class VideoModel {
  final DateTime dateTime;
  final String title;
  final int likes;

  VideoModel({
    required this.title,
    required this.dateTime,
    required this.likes,
  });
}

final videos = [
  VideoModel(title: "地上最強の生物決定戦", dateTime: DateTime(2021, 8, 9, 18, 00), likes: 1250000),
  VideoModel(title: "ハンターハンター考察", dateTime: DateTime(2018, 3, 2, 12, 00), likes: 3400000),
  VideoModel(title: "北センチネル島行ってみた", dateTime: DateTime(2022, 4, 20, 3, 00), likes: 98003000),
];

