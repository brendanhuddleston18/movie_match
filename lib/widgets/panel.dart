import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_match/services/movie_service.dart';

class PanelWidget extends StatelessWidget {
  const PanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(CupertinoIcons.chevron_compact_up),
        Obx(() => Text(
              (movies.currentMovie.value!.content.title) ?? "empty",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 16),
            child: Obx(() => Text(
                  "${movies.currentMovie.value!.content.rating.toString()}/10 ",
                ))),
        const Text("Description",
            style: TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(0, 122, 255, 1),
                decoration: TextDecoration.underline)),
        Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: Obx(() => Text(
                  movies.currentMovie.value!.content.description,
                ))),
        const Text(
          "Cast",
          style: TextStyle(
              fontSize: 24,
              color: Color.fromRGBO(0, 122, 255, 1),
              decoration: TextDecoration.underline),
        ),
        ListView.builder(
          padding: const EdgeInsets.fromLTRB(172, 0, 0, 0),
          shrinkWrap: true,
          itemCount: movies.currentMovie.value!.content.cast.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(movies.currentMovie.value!.content.cast[index]);
          },
        ),
      ],
    );
  }
}
