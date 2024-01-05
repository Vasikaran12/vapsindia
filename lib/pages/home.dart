import 'dart:html';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> images = [
    'images/img1.jpg',
    'images/img2.jpg',
    'images/img3.png',
    'images/img4.jpg',
    'images/img5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          foregroundColor: Colors.white,
          title: const Text(
            "VAPSINDIA",
            style: TextStyle(
                letterSpacing: 2,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 500),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      //height: 200,
                      enlargeCenterPage: true,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      onScrolled: (_) {},
                      onPageChanged: (position, reason) {
                        debugPrint(reason.toString());
                        debugPrint(
                            CarouselPageChangedReason.controller.toString());
                      },
                      enableInfiniteScroll: true,
                    ),
                    items: images.map<Widget>((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              i,
                              alignment: Alignment.topCenter,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              )),
        ));
  }
}
