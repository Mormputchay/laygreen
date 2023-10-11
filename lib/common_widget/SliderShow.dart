import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/imgList.dart';

class SliderShow extends StatefulWidget {
  const SliderShow({
    super.key,
  });

  @override
  State<SliderShow> createState() => _SliderShowState();
}

class _SliderShowState extends State<SliderShow> {
  final carouselController = CarouselController();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return CarouselSlider.builder(
        carouselController: carouselController,
        itemCount: imgList.length,
        itemBuilder: (context, index, realIndex) {
          final urlImage = imgList[index];
          return buildImage(urlImage, media, index);
        },
        options: CarouselOptions(
            height: 170,
            initialPage: 0,
            viewportFraction: 1,
            autoPlay: false,
            enableInfiniteScroll: true,
            animateToClosest: true,
            autoPlayInterval: const Duration(seconds: 1),
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            }));
  }

  Container buildImage(String urlImage, Size media, int index) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              urlImage,
              width: media.width,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Welcome to".toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Image.asset(
                  "asset/images/logo.png",
                  width: 250,
                  height: 80,
                ),
                const SizedBox(height: 5),
                const Text(
                  "088 2001 999",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      builderIndicatior(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  AnimatedSmoothIndicator builderIndicatior() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: imgList.length,
      onDotClicked: animateToSlide,
      effect: JumpingDotEffect(
          dotWidth: 10,
          dotHeight: 10,
          activeDotColor: Colors.green.shade900,
          dotColor: Colors.black45),
    );
  }

  animateToSlide(int index) {
    carouselController.animateToPage(index);
  }
}
