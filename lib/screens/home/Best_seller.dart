import 'package:flutter/material.dart';
import 'package:laygreen/screens/details/details_screens.dart';

class BestSeller extends StatelessWidget {
  BestSeller({super.key});
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
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: BestSeller1.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                mainAxisExtent: 190),
            itemBuilder: (context, index) {
              var pObj = BestSeller1[index] as Map? ?? {};
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailsScreen()));
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              pObj["image"].toString(),
                              width: double.maxFinite,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              pObj["name"].toString().toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 35,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade900,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
