import 'package:flutter/material.dart';

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
    const Text("Available Experiments"),
    const Text("Created Experiments"),
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
    return Flexible(
      child: SizedBox(
        child: Column(children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  height: 8,
                ),
              ),
              TabBar(
                  labelPadding: const EdgeInsets.only(bottom: 8),
                  controller: _controller,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: const Color.fromRGBO(131, 89, 227, 1),
                  labelColor: const Color.fromRGBO(131, 89, 227, 1),
                  indicatorWeight: 8,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color.fromRGBO(131, 89, 227, 1)),
                  unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black),
                  tabs: tabs),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: widget.childrens,
            ),
          )
        ]),
      ),
    );
  }
}
