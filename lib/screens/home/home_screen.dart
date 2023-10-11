import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:laygreen/common_widget/SliderShow.dart';
import 'package:laygreen/data/imgList.dart';
import 'package:laygreen/screens/home/Best_seller.dart';

import '../../common_widget/buildAppbar.dart';
import '../../data/data1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final controller = CarouselController();
  int activeIndex = 0;
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: const BuildAppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "asset/images/bg.png",
            width: media.width,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 55,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: data1.length,
                          itemBuilder: (context, index) {
                            var pObj = data1[index] as Map? ?? {};
                            return Stack(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  width: media.width * 0.28,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        pObj["image"].toString(),
                                        height: 40,
                                        width: 40,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            pObj["name"]
                                                .toString()
                                                .toUpperCase(),
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                fontSize: 10.5,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SliderShow(),
                    const SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Video",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade900),
                          ),
                          const Text(
                            "See all",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    CarouselSlider.builder(
                        itemCount: imgList.length,
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = imgList[index];
                          return Container(
                            width: double.maxFinite,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    urlImage,
                                    width: media.width,
                                    fit: BoxFit.cover,
                                  ),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size: 50,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                            height: 180,
                            initialPage: 0,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                activeIndex = index;
                              });
                            })),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        DefaultTabController(
                          length: 5,
                          child: TabBar(
                            onTap: (index) {},
                            isScrollable: true,
                            controller: tabController,
                            tabs: const <Widget>[
                              Tab(
                                  child: Text(
                                "Latest",
                                style: TextStyle(fontSize: 18),
                              )),
                              Tab(child: Text("Best sale")),
                              Tab(child: Text("Promotion")),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          BestSeller(),
                          const Center(
                            child: Text("Best sale"),
                          ),
                          const Center(
                            child: Text("Promotion"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
