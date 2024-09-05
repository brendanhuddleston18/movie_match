import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_match/services/database_service.dart';

class DeleteWidget extends StatelessWidget {
  const DeleteWidget(
      {super.key, required this.movieToDelete, required this.handleRefresh});

  final String movieToDelete;
  final Function() handleRefresh;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          database
              .deleteMovieFromWatchlist(movieToDelete)
              .then((_) => handleRefresh());
        },
        icon: const Icon(CupertinoIcons.trash));
  }
}
