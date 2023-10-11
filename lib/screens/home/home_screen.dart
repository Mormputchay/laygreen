import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:laygreen/screens/home/Best_seller.dart';

import '../../common_widget/SliderShow.dart';
import '../../common_widget/buildAppbar.dart';
import '../../common_widget/tab_text_button.dart';
import '../../data/data1.dart';
import '../../data/imgList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController tabController;
  int activeIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: const BuildAppBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Image.asset(
                "asset/images/bg.png",
                width: media.width,
                height: media.height,
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 55,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: data1.length,
                            itemBuilder: (context, index) {
                              var pObj = data1[index] as Map? ?? {};
                              return Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    width: media.width * 0.28,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                        height: 10,
                      ),
                      const SliderShow(),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          TabTextButton(
                            title: "Latest",
                            isActive: selectTab == 0,
                            onPressed: () {
                              setState(() {
                                selectTab = 0;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          TabTextButton(
                            title: "Best sale",
                            isActive: selectTab == 1,
                            onPressed: () {
                              setState(() {
                                selectTab = 1;
                              });
                            },
                          ),
                          TabTextButton(
                            title: "Promotion",
                            isActive: selectTab == 2,
                            onPressed: () {
                              setState(() {
                                selectTab = 2;
                              });
                            },
                          ),
                        ],
                      ),
                      if (selectTab == 0)
                        BestSeller()
                      else if (selectTab == 1)
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: media.width * 0.2),
                              Image.asset(
                                "asset/images/no-data.png",
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        )
                      else
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: media.width * 0.2),
                              Image.asset(
                                "asset/images/no-data.png",
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
