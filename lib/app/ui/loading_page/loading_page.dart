import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_movies/app/bloc/homepage_bloc/homepage_bloc.dart';
import 'package:trending_movies/app/bloc/homepage_bloc/homepage_event.dart';
import 'package:trending_movies/app/bloc/homepage_bloc/homepage_state.dart';
import 'package:trending_movies/app/repository/mapper/movie_hive_response_mapper.dart';
import 'package:trending_movies/app/ui/homepage/homepage.dart';
import 'package:trending_movies/app/utils/error_page.dart';
import 'package:trending_movies/app/utils/loading_widgets.dart';
import 'package:trending_movies/services/connectivity/network_services.dart';
import 'package:trending_movies/services/hivedb/hive_db.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      var nowPlayingMovies = HiveManager().nowPlayingBox;
      var trendingMovie = HiveManager().trendingMovieBox;
      if (nowPlayingMovies.isNotEmpty && trendingMovie.isNotEmpty) {
        var nowPlayingMovieList = nowPlayingMovies.values.toList();

        var trendingMovieList = nowPlayingMovies.values.toList();

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Homepage(
                  trendingMovies: mapHiveListToMovies(nowPlayingMovieList),
                  nowPlayingMovies: mapHiveListToMovies(trendingMovieList),
                )));
        return;
      }
    });

    var hasInternet = await NetworkService().hasInternet();
    if (hasInternet) {
      homeBloc.add(HomePageFetchMoviesEvent());
    } else {
      homeBloc.add(HomePageNoInternetEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => homeBloc,
          ),
        ],
        child: BlocListener<HomeBloc, HomepageState>(
          bloc: homeBloc,
          listener: (context, state) {
            if (state is HomePageLoadDataCompleteState) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Homepage(
                        trendingMovies: state.trendingMoviesList ?? [],
                        nowPlayingMovies: state.nowPlayingMoviesList ?? [],
                      )));
            }
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            body: BlocBuilder<HomeBloc, HomepageState>(
                bloc: homeBloc,
                builder: (context, state) {
                  if (state is NoInternetState) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Center(
                        child: ErrorPage(
                          message:
                              'Please check you internet connection and try again ',
                          onTap: () {
                            _init();
                          },
                        ),
                      ),
                    );
                  }

                  if (state is HomePageErrorState) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Center(
                        child: ErrorPage(
                          onTap: () {
                            homeBloc.add(HomePageFetchMoviesEvent());
                          },
                        ),
                      ),
                    );
                  }
                  return Center(child: LoadingWidget());
                }),
          ),
        ));
  }
}
