
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PopMovieDetails extends StatefulWidget {
  PopMovieDetails({
    super.key,
    required this.id,
    required this.image,
    required this.overview,
    required this.title,
    required this.date,
  });
  final id;
  final date;
  final image;
  final title;
  final overview;

  @override
  State<PopMovieDetails> createState() => _PopMovieDetailsState();
}

class _PopMovieDetailsState extends State<PopMovieDetails> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.width * .5,
                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: widget.image,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                          ))),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              child: Text(
                'Pg 13  ' + widget.date + '   HD',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Play   ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.download,
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Download   ',
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1.1,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              child: Text(
                widget.overview,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'My List',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.share_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
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
                        Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
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
                        Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'info',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
