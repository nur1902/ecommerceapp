import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/paths/assetpaths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Screens/sign_in.dart';
import '../Screens/sign_up_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';

class HomeCarosolSlider extends StatefulWidget {
  const HomeCarosolSlider({super.key});

  @override
  State<HomeCarosolSlider> createState() => _HomeCarosolSliderState();
}

class _HomeCarosolSliderState extends State<HomeCarosolSlider> {
  final List<Widget> _widget=[
    SvgPicture.asset(Assetpaths.logo_nav),
    SvgPicture.asset(Assetpaths.logo),
    SvgPicture.asset(Assetpaths.logo_nav),
    SvgPicture.asset(Assetpaths.logo),
    SvgPicture.asset(Assetpaths.logo_nav),
    SvgPicture.asset(Assetpaths.logo),
    SvgPicture.asset(Assetpaths.logo_nav),
    SvgPicture.asset(Assetpaths.logo),


  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CarouselSlider(
        items: _widget,
        options: CarouselOptions(
          height: 150,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 1),
          autoPlayAnimationDuration: Duration(milliseconds: 100),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,

          scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
                    setState(() {
                     currentIndex = index;
                    });}
        ),
         ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_widget.length, (index) {
                bool isActive = currentIndex == index;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 12 : 8,
                  height: isActive ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? Colors.green : Colors.white,
                    border: Border.all(color: Colors.grey),
                  ),
                );
              })),


      ]);
        // CarouselSlider(
        //   options: CarouselOptions(
        //     height: 200,
        //     viewportFraction: 1.0,
        //     autoPlay: true,
        //     autoPlayInterval: const Duration(seconds: 1),
        //     autoPlayAnimationDuration: const Duration(milliseconds: 300),
        //     autoPlayCurve: Curves.fastOutSlowIn,
        //
        //     onPageChanged: (index, reason) {
        //       setState(() {
        //         currentIndex = index;
        //       });
        //     },
        //   ),

          // items: [1,2,3,4].map((i) {
          //   return Column(
          //     children: [
          //      Stack(
          //        children: [
          //          Container(
          //            height: 100,
          //            width: 100,
          //            color: Colors.grey,
          //            child: _widget[currentIndex],
          //          )
          //        ],
          //      )
          //     ],
          //   );
          // }).toList(),
    //     ),
    //
    //     const SizedBox(height: 10),
    //
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: List.generate(5, (index) {
    //         bool isActive = currentIndex == index;
    //
    //         return AnimatedContainer(
    //           duration: const Duration(milliseconds: 300),
    //           margin: const EdgeInsets.symmetric(horizontal: 4),
    //           width: isActive ? 12 : 8,
    //           height: isActive ? 12 : 8,
    //           decoration: BoxDecoration(
    //             shape: BoxShape.circle,
    //             color: isActive ? Colors.teal : Colors.white,
    //             border: Border.all(color: Colors.grey),
    //           ),
    //         );
    //       }),
    //     ),
    //   ],
    // );
  }
}