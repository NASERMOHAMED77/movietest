// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietest/features/home/peresintaion/manager/home_cubit/cubit._home_page.dart';
import 'package:movietest/features/home/peresintaion/view/Movie_details_screen.dart';

class MoviesList extends StatelessWidget {
  MoviesList(
      {super.key,
      required this.text,
      required this.image,
      required this.id,
      required this.title,
      required this.data});
  String image;
  String text;
  String data;
  final id;
  String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        show_bottom_sheet(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: MediaQuery.of(context).size.width * .3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 180,
                width: 110,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      placeholder: (context, url) => Center(
                          child: Container(
                        color: Colors.black,
                      )),
                    ))),
          ],
        ),
      ),
    );
  }

  Future<dynamic> show_bottom_sheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.grey.shade900,
        context: context,
        builder: ((context) {
          return SizedBox(
            height: MediaQuery.of(context).size.width * .8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 150,
                          width: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: image,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                              ))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  title,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 18,
                                      color: Colors.white,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade800,
                                child: IconButton(
                                    onPressed: (() => Navigator.pop(context)),
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, bottom: 5, top: 5),
                            child: Text(
                              'Pg 13  ' + data + '   HD',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Text(
                            text,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade50,
                                fontWeight: FontWeight.w700),
                            maxLines: 7,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                BottomSheetRow(
                    id: id, image: image, title: title, data: data, text: text),
                Container(
                  height: .2,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 20,
                  width: double.infinity,
                  child: const Row(children: [
                    Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'info',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    )
                  ]),
                )
              ],
            ),
          );
        }));
  }
}

class BottomSheetRow extends StatelessWidget {
  const BottomSheetRow({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.data,
    required this.text,
  });

  final id;
  final String image;
  final String title;
  final String data;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            InkWell(
              onTap: (() {
                BlocProvider.of<HomeCubit>(context).fetchtopratedmoviesapi(id);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (
                      context,
                    ) =>
                            PopMovieDetails(
                              image: image,
                              title: title,
                              id: id,
                              date: data,
                              overview: text,
                            )));
              }),
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade50,
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Play',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: const Icon(
                Icons.share_sharp,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Share',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: const Icon(
                Icons.download,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              'Download',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'My List',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}
