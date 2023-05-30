// import 'package:flutter/material.dart';
// import 'package:one_tap_health/screen/home/home_page.dart';
//
//
// class CustomBottomBar extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
// class _HomePageState extends State<CustomBottomBar> {
//   int _currentIndex = 1;
//   List<Widget> _pages = [];
//   @override
//   void initState() {
//     _pages.add(MenusScreen());
//     _pages.add(MenusScreen());
//     _pages.add(MenusScreen());
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.appColor,
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 8.0,
//         clipBehavior: Clip.antiAlias,
//         child: Container(
//           height: kBottomNavigationBarHeight,
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//
//             ),
//             child: BottomNavigationBar(
//                 currentIndex: _currentIndex,
//                 backgroundColor: AppColor.textColorBlue,
//                 selectedItemColor: AppColor.appBlue,
//                 onTap: (index) {
//                   setState(() {
//                     _currentIndex = index;
//                   });
//                 },
//                 items: [
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.category), label: 'Category'),
//                   BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.settings_outlined), label: 'Setting')
//                 ]),
//           ),
//         ),
//       ),
//       floatingActionButtonLocation:
//       FloatingActionButtonLocation.miniCenterDocked,
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: FloatingActionButton(
//           backgroundColor: _currentIndex == 1 ? Colors.blue : Colors.blueGrey,
//           child: Icon(Icons.home),
//           onPressed: () => setState(() {
//             _currentIndex = 1;
//           }),
//         ),
//       ),
//     );
//   }
// }