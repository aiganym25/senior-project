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
                height: MediaQuery.of(context).size.height * 0.9,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  'Experiments',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'Sansation',
                      fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
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
