import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List BestSeller1 = [
    {
      "id": 1,
      "name": "BG188C10_SNow",
      "image":
          "https://www.daugres.com.hk/wp-content/uploads/2021/04/m_giallopernice.jpg",
    },
    {
      "id": 2,
      "name": "BG188C18_SNow",
      "image":
          "https://www.daugres.com.hk/wp-content/uploads/2021/04/m_giallopernice.jpg",
    },
    {
      "id": 3,
      "name": "BG188C19_SNow",
      "image":
          "https://www.daugres.com.hk/wp-content/uploads/2021/04/m_giallopernice.jpg",
    },
    {
      "id": 4,
      "name": "BG188C16_SNow",
      "image":
          "https://www.daugres.com.hk/wp-content/uploads/2021/04/m_giallopernice.jpg",
    },
    {
      "id": 5,
      "name": "BG188C15_SNow",
      "image":
          "https://www.daugres.com.hk/wp-content/uploads/2021/04/m_giallopernice.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green.shade900,
        centerTitle: true,
        title: const Text(
          "Detail",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "asset/images/bg.png",
            width: media.width,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "https://www.daugres.com.hk/wp-content/uploads/2021/04/m_giallopernice.jpg",
                  width: double.maxFinite,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Colors.green.shade900,
                          borderRadius: BorderRadius.circular(20)),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 15, top: 15),
                  child: Text(
                    "BM 188130SL_CARRARA",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
                  child: Text(
                    "Series: Marmi Classico, Finish: Silk, Color: Carrara,\nSize: 80x180cm",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10, top: 10),
                  child: Text(
                    "Related Products",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 330,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: BestSeller1.length,
                        itemBuilder: (context, index) {
                          var pObj = BestSeller1[index] as Map? ?? {};
                          return Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          offset: const Offset(0, 3))
                                    ]),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            pObj["image"].toString(),
                                            height: 150,
                                            width: double.maxFinite,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10),
                                            Text(
                                              pObj["name"].toString(),
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.green.shade900,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: const Icon(
                                                Icons.favorite,
                                                size: 20,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: MaterialButton(
                    minWidth: 115,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    height: 60,
                    onPressed: () {},
                    color: Colors.black,
                    child: const Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.green.shade900,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 25,
                              color: Colors.white,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Add to Favourite",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
