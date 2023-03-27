import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/providers/request_mv.dart';
import 'package:senior_project/pages/feed-home/available_experiments.dart';
import 'package:senior_project/widgets/swipable_tabbar.dart';
import 'package:senior_project/pages/feed-home/requested_experiment_page.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(248, 180, 1, 1),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: const Text(
                  'Experiments',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'Sansation',
                      fontWeight: FontWeight.w800),
                ),
              ),
              Positioned(
                top: 70,
                left: 0,
                bottom: 0,
                right: 0,
                child: SwipableTabbar(childrens: [
                  ChangeNotifierProvider<RequestedExperimentsMV>(
                    create: (_) => RequestedExperimentsMV(),
                    child: const AvailableExperiments(),
                  ),
                  ChangeNotifierProvider<RequestedExperimentsMV>(
                    create: (_) => RequestedExperimentsMV(),
                    child: const RequestedExperimentPage(),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}
