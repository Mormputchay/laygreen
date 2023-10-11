import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green.shade900,
      leading: GestureDetector(
        onTap: () {},
        child: Image.asset(
          "asset/images/dots-menu.png",
          color: Colors.white,
        ),
      ),
      title: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.maxFinite,
          height: 44,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 28,
                    color: Colors.black,
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 35,
              color: Colors.white,
            ))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
