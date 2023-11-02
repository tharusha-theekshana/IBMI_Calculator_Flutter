import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ibmi_calculator/pages/bmi_page.dart';
import 'package:ibmi_calculator/pages/history_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static final List<Widget> _tabs = [const BMIPage(), HistoryPage()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text("IBMI"),
            backgroundColor: Color.fromRGBO(217, 213, 213, 1.0),
          ),
          child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                  CupertinoIcons.home,
                  size: 23,
                )),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.clock, size: 23))
              ],
            ),
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (context) {
                  return _tabs[index];
                },
              );
            },
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("IBMI",style: TextStyle(
            color: Colors.black
          ),),
          backgroundColor: const Color.fromRGBO(217, 213, 213, 1.0),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(217, 213, 213, 1.0),
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home,size: 30),
            ),
            BottomNavigationBarItem(
              label: 'History',
              icon: Icon(Icons.timelapse,size: 30),
            ),
          ],
        ),
        body: _tabs[_selectedIndex],
      );
    }
  }

}
