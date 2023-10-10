
import 'package:flutter/material.dart';

class TopBarMinWidget extends StatelessWidget {
  const TopBarMinWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          alignment: Alignment.center,
          width: double.infinity,
          color: Colors.black.withOpacity(.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Image.asset(
                  'images/x.png',
                  width: 40,
                ),
              
              Row(
                children: const [
                  Icon(
                      Icons.search_rounded,
                      size: 25,
                      color: Colors.white,
                    ),
                  
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          width: double.infinity,
          color: Colors.black.withOpacity(.5),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'TV Shows',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Text(
                'Movies',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Text(
                'Categories',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
