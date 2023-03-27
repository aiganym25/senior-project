import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwipableTabbar extends StatefulWidget {
  const SwipableTabbar({Key? key, required this.childrens}) : super(key: key);
  final List<Widget> childrens;

  @override
  State<SwipableTabbar> createState() => _SwipableTabbarState();
}

class _SwipableTabbarState extends State<SwipableTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  late List<Widget> tabs = [
    const Text("Joinable"),
    const Text("Requests"),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.childrens.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var txt = '';
  void changeTitle(int index) {
    if (index == 1) {
      txt = 'Available experiments:';
    } else {
      txt = 'Created experiments:';
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      changeTitle(_controller.index);
    });
    return Column(
        children: [
          TabBar(
              labelPadding: EdgeInsets.only(bottom: 14.h),
              controller: _controller,
              unselectedLabelColor: const Color.fromRGBO(255, 255, 255, 0.8),
              indicatorColor: const Color.fromRGBO(255, 255, 255, 1),
              labelColor: const Color.fromRGBO(255, 255, 255, 1),
              indicatorWeight: 5.h,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.w,
                  color: const Color.fromRGBO(255, 255, 255, 1)),
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.w,
                  color: const Color.fromRGBO(255, 255, 255, 1)),
              tabs: tabs),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 25,
              ),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: TabBarView(
                controller: _controller,
                children: widget.childrens,
              ),
            ),
          )
        ]);
  }
}
