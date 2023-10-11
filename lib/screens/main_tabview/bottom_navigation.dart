import 'package:flutter/material.dart';
import 'package:laygreen/screens/home/home_screen.dart';
import 'package:laygreen/screens/login_screen/login_screen.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});
  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const LoginScreen(),
    const LoginScreen(),
    const LoginScreen(),
  ];
  void _onItemTap(int index) {
    setState(() {
      selectTab = index;
    });
  }

  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(selectTab),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectTab,
          elevation: 5,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.green.shade900,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: _onItemTap,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "asset/images/shop.png",
                  width: 32,
                  height: 32,
                  color: selectTab == 0 ? Colors.green.shade900 : Colors.black,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                  size: 32,
                  color: selectTab == 1 ? Colors.green.shade900 : Colors.black,
                ),
                label: "message"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 32,
                  color: selectTab == 2 ? Colors.green.shade900 : Colors.black,
                ),
                label: "favorite"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_pin,
                  size: 32,
                  color: selectTab == 3 ? Colors.green.shade900 : Colors.black,
                ),
                label: "Person")
          ],
        ));
  }
}
