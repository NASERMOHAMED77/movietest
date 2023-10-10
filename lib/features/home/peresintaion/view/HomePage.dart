// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietest/features/home/peresintaion/manager/home_cubit/cubit._home_page.dart';
import 'package:movietest/features/home/peresintaion/view/widgets/bottom_main_widget.dart';
import 'package:movietest/features/home/peresintaion/view/widgets/movies_list_widget.dart';
import 'package:movietest/features/home/peresintaion/view/widgets/top_main_widget.dart';
import 'package:movietest/features/home/peresintaion/manager/home_cubit/home_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              BlocBuilder<HomeCubit, HomePageStates>(
                builder: (context, state) {
                  if (BlocProvider.of<HomeCubit>(context).model.length == 0) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return CarouselSlider.builder(
                        itemCount:
                            BlocProvider.of<HomeCubit>(context).model.length,
                        itemBuilder: ((context, index, realIndex) {
                          return Stack(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/original/' +
                                          BlocProvider.of<HomeCubit>(context)
                                              .model[index]
                                              .image
                                              .toString(),
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                ),
                              ),
                              const TopBarMinWidget(),
                              const BottomMainWidget(),
                            ],
                          );
                        }),
                        options: CarouselOptions(
                            height: 500,
                            autoPlay: true,
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height));
                  }
                },
              ),
              const SizedBox(

                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(
                    "Playing Now",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              BlocBuilder<HomeCubit, HomePageStates>(
                
                builder: (context, state) {
                  if (state is GetUpComingMoviesSFailed) {
                    return Center(
                      child: Text('NoData'),
                    );
                  } else if (state is GetUpComingMoviesSucess) {
                    return SizedBox(
                      height: 190,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: BlocProvider.of<HomeCubit>(context)
                              .ucomingMovies
                              .length,
                          itemBuilder: (context, index) {
                            return MoviesList(
                              id: BlocProvider.of<HomeCubit>(context)
                                  .ucomingMovies[index]
                                  .id,
                              title: BlocProvider.of<HomeCubit>(context)
                                  .ucomingMovies[index]
                                  .title,
                              data: BlocProvider.of<HomeCubit>(context)
                                  .ucomingMovies[index]
                                  .data,
                              text: BlocProvider.of<HomeCubit>(context)
                                  .ucomingMovies[index]
                                  .overview,
                              image: 'https://image.tmdb.org/t/p/original/' +
                                  BlocProvider.of<HomeCubit>(context)
                                      .ucomingMovies[index]
                                      .image
                                      .toString(),
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(
                    "Top Movies",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              BlocBuilder<HomeCubit, HomePageStates>(
                builder: (context, state) {
                  if (state is GetTopMoviesSFailed) {
                    return Center(child: Text("NoData"));
                  } else if (state is GetTopMoviesSucess) {
                    return SizedBox(
                      height: 190,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: BlocProvider.of<HomeCubit>(context)
                              .topmovies
                              .length,
                          itemBuilder: (context, index) {
                            return MoviesList(
                              id: BlocProvider.of<HomeCubit>(context)
                                  .topmovies[index]
                                  .id,
                              title: BlocProvider.of<HomeCubit>(context)
                                  .topmovies[index]
                                  .title,
                              data: BlocProvider.of<HomeCubit>(context)
                                  .topmovies[index]
                                  .data,
                              text: BlocProvider.of<HomeCubit>(context)
                                  .topmovies[index]
                                  .overview,
                              image: 'https://image.tmdb.org/t/p/original/' +
                                  BlocProvider.of<HomeCubit>(context)
                                      .topmovies[index]
                                      .image
                                      .toString(),
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ]),
          ),
        ));
  }
}

