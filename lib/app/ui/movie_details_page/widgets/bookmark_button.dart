import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_movies/app/bloc/movie_detail_page_bloc/movie_detail_page_bloc.dart';
import 'package:trending_movies/app/bloc/movie_detail_page_bloc/movie_detail_page_event.dart';
import 'package:trending_movies/app/bloc/movie_detail_page_bloc/movie_detail_page_state.dart';

class BookmarkButton extends StatefulWidget {
  final bool isSaved;
  const BookmarkButton({super.key, this.isSaved = false});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  late MovieDetailPageBloc movieDetailsBloc;
  bool currentSavedStatus = false;
  @override
  void initState() {
    movieDetailsBloc = context.read<MovieDetailPageBloc>();
    currentSavedStatus = widget.isSaved;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        listener: (context, state) {
          if (state is BookmarkToggleState) {
            currentSavedStatus = state.saveStatus;
          }
        },
        bloc: movieDetailsBloc,
        builder: (context, state) {
          return IconButton(
            icon: Icon(
              currentSavedStatus
                  ? Icons.bookmark_added_sharp
                  : Icons.bookmark_add_rounded,
              color: Colors.amber,
              size: 40,
            ),
            onPressed: () {
              movieDetailsBloc.add(BookmarkMovie(save: !currentSavedStatus));
            },
          );
        });
  }
}
