import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_pracitce/screens/second_screen.dart';

import '../models/video_model.dart';

enum SortType {
  likes,
  date,
  title,
}

final sortTypeProvider = StateProvider<SortType>((ref) {
  return SortType.likes;
});

//DropDownButtonが押された時、VideoModelのグローバル変数であるvideoを呼び出すとどうなるのか？
//グローバル変数だから、普通に上書きされている
final videoProvider = Provider<List<VideoModel>>((ref) {
  final sortType = ref.watch(sortTypeProvider);
  switch (sortType) {
    case SortType.date:
      videos.sort((a, b) => a.title.compareTo(b.title));
      return videos;
    case SortType.likes:
      videos.sort((a, b) => a.likes.compareTo(b.likes));
      return videos;
    case SortType.title:
      videos.sort((a, b) => a.dateTime.compareTo(b.dateTime));
      return videos;
  }
});

class YoutubeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videos = ref.watch(videoProvider);
    print("videos: ${videos[0].dateTime}");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Youtube"),
        centerTitle: true,
        actions: [
          DropdownButton<SortType>(
            items: const [
              DropdownMenuItem(
                child: Icon(Icons.favorite),
                value: SortType.likes,
              ),
              DropdownMenuItem(
                child: Icon(Icons.access_time),
                value: SortType.date,
              ),
              DropdownMenuItem(
                child: Icon(Icons.title),
                value: SortType.title,
              ),
            ],
            onChanged: (value) =>
                ref.read(sortTypeProvider.notifier).state = value!,
            value: ref.watch(sortTypeProvider),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                child: ListTile(
                  title: Text(videos[index].title),
                  subtitle: Text(
                      "${videos[index].likes.toString()}いいね ${videos[index].dateTime}"),
                ),
              ),
            );
          }),
    );
  }
}
