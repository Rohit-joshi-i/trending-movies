import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:trending_movies/app/bloc/search_page_bloc/search_page_bloc.dart';
import 'package:trending_movies/app/bloc/search_page_bloc/search_page_event.dart';
import 'package:trending_movies/app/bloc/search_page_bloc/search_page_state.dart';
import 'package:trending_movies/app/repository/model/movies_model.dart';
import 'package:trending_movies/app/ui/movie_details_page/movie_details_page.dart';
import 'package:trending_movies/app/ui/search_page/widgets/search_bar_widget.dart';
import 'package:trending_movies/app/ui/search_page/widgets/search_card_widget.dart';
import 'package:trending_movies/app/utils/error_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchPageBloc searchPageBloc = SearchPageBloc();
  TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;

  int pageNo = 1;
  List<MovieModel> searchResults = [];

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.8 &&
          !isLoadingMore) {
        // reached 80% of the list
        searchPageBloc.add(SearchMoreMovieEvent(
            keyWord: searchController.text, pageNo: pageNo));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchPageBloc>(
          create: (context) => searchPageBloc,
        ),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
          ),
          SearchBarWidget(
            searchPageBloc: searchPageBloc,
            searchController: searchController,
          ),
          BlocConsumer(
            bloc: searchPageBloc,
            listener: (context, state) {
              if (state is NewSearchResultErrorState) {
                isLoadingMore = false;
                const snackBar = SnackBar(
                    content: Text(
                        'Something went wrong while fetching your movies'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else if (state is SearchResultWithItemsLoading) {
                isLoadingMore = true;
              } else if (state is SearchResultFound) {
                isLoadingMore = false;
                searchResults = state.searchResult;
                pageNo = 2;
              } else if (state is SearchResultWithItemsFound) {
                isLoadingMore = false;
                pageNo = state.pageNo;
                searchResults += state.searchResult;
              }
            },
            builder: (context, state) {
              if (state is SearchResultErrorState) {
                return Center(child: ErrorPage(
                  onTap: () {
                    searchPageBloc.add(SearchMoreMovieEvent(
                        keyWord: searchController.text, pageNo: 1));
                  },
                ));
              }
              if (searchController.text.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text(
                      'Find your favourite Movies Here...',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
              }
              if (state is SearchResultFound && searchResults.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text(
                      'No Results with "${searchController.text}" found',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                );
              }

              return Expanded(
                child: ListView.separated(
                  controller: _scrollController,
                  itemCount: searchResults.length +
                      (state is SearchResultWithItemsLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (state is SearchResultWithItemsLoading &&
                        index == searchResults.length) {
                      return Container(
                        width: 40,
                        padding: EdgeInsets.all(25),
                        child: Center(
                          child: LoadingAnimationWidget.waveDots(
                              color: Colors.white, size: 50),
                        ),
                      );
                    }

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetailsPage(
                                    movieId:
                                        searchResults[index].id.toString())));
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.shade900),
                          child: SearchCardWidget(
                            movie: searchResults[index],
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
