import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_match/services/database_service.dart';
import 'package:movie_match/widgets/delete_button.dart';

class WatchlistWidget extends StatefulWidget {
  const WatchlistWidget({super.key});

  @override
  State<WatchlistWidget> createState() => _WatchlistWidgetState();
}

class _WatchlistWidgetState extends State<WatchlistWidget> {
  late Future<List<dynamic>> watchlistFuture;

  @override
  void initState() {
    super.initState();
    watchlistFuture = database.getWatchlist();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.chevron_back)),
          middle: const Text(
            "Watchlist",
            style:
                TextStyle(fontSize: 22, color: Color.fromRGBO(0, 122, 255, 1)),
          ),
        ),
        child: FutureBuilder<List<dynamic>>(
            future: watchlistFuture,
            builder: ((BuildContext context, AsyncSnapshot snapshot) {
              var watchlist = snapshot.data ?? [];
              if (snapshot.hasData) {
                return CupertinoListSection(
                  header: const Text("Your Watchlist"),
                  children: watchlist.map<Widget>((dynamic movie) {
                    return CupertinoListTile(
                      title: Text(movie['name']),
                      trailing: DeleteWidget(
                        movieToDelete: movie['id'],
                        handleRefresh: () {
                          setState(() {
                            watchlistFuture = database.getWatchlist();
                          });
                        },
                      ),
                    );
                  }).toList(),
                );
              } else {
                return const Center(
                  child: Icon(CupertinoIcons.xmark),
                );
              }
            })));
  }
}
