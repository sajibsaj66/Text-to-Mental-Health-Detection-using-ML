// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


List<String> imgList = [
  'assets/3.png',
  'assets/1.png',
  'assets/2.png',
  'assets/4.png',
];
final List<Widget> imgSlider = imgList
    .map((e) => Container(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                e,
                fit: BoxFit.cover,
                width: double.infinity,
              )),
        ))
    .toList();

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            items: imgSlider,
            options: CarouselOptions(
                height: 180,
                viewportFraction: 0.95,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: ((index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                })),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((e) {
              int index = imgList.indexOf(e);
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.only(left: 15, top: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Color.fromARGB(228, 22, 120, 233)
                        : Color.fromRGBO(0, 0, 0, .4)),
              );
            }).toList(),
          ),

//

        
        ],
      ),
    );
  }
}
