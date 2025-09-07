import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_movies/app/bloc/bottom_navigation_bloc/bottom_navigation_bloc.dart';
import 'package:trending_movies/app/bloc/bottom_navigation_bloc/bottom_navigation_event.dart';
import 'package:trending_movies/app/bloc/bottom_navigation_bloc/bottom_navigation_state.dart';
import 'package:trending_movies/app/bloc/homepage_bloc/homepage_bloc.dart';
import 'package:trending_movies/app/repository/model/movies_model.dart';
import 'package:trending_movies/app/repository/repo.dart';
import 'package:trending_movies/app/ui/bookmarks/bookmarks_page.dart';
import 'package:trending_movies/app/ui/homepage/movies_page.dart';
import 'package:trending_movies/app/ui/search_page/search_page.dart';
import 'package:trending_movies/app/utils/error_page.dart';

class Homepage extends StatefulWidget {
  final List<MovieModel> trendingMovies;
  final List<MovieModel> nowPlayingMovies;

  const Homepage(
      {required this.trendingMovies,
      required this.nowPlayingMovies,
      super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Repository repository = Repository();

  static List<Widget> _pages = [];
  @override
  void initState() {
    _pages = [
      MoviesPage(
        trendingMovies: widget.trendingMovies,
        nowPlayingMovies: widget.nowPlayingMovies,
      ),
      const SearchPage(),
      const BookmarksPage(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavigationBloc>(
            create: (context) => BottomNavigationBloc(),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(),
          ),
        ],
        child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
            if (state is BottomNavigationCompleteState) {
              return Scaffold(
                backgroundColor: Colors.black,
                body: _pages[state.index ?? 0],
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.black,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  currentIndex: state.index ?? 0,
                  onTap: (index) {
                    context
                        .read<BottomNavigationBloc>()
                        .add(BottomNavigationUpdateEvent(index: index));
                  },
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.bookmark),
                      label: 'Bookmark',
                    ),
                  ],
                ),
              );
            }
            return const ErrorPage();
          },
        ),
      ),
    );
  }
}
