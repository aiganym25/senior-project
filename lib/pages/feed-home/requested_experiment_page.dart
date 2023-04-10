import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/providers/request_mv.dart';
import 'package:http/http.dart' as http;
import '../../widgets/cards/request_card.dart';

class RequestedExperimentPage extends StatefulWidget {
  const RequestedExperimentPage({Key? key}) : super(key: key);

  @override
  State<RequestedExperimentPage> createState() =>
      _RequestedExperimentPageState();
}

class _RequestedExperimentPageState extends State<RequestedExperimentPage> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RequestedExperimentsMV>(context);
    return FutureBuilder(
        future: model.getRequestType(),
        builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
          if (snapshot.hasData) {
            var experiments = jsonDecode(snapshot.data!.body)['data'];
            return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    experiments.isNotEmpty
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: experiments.length,
                            itemBuilder: (context, index) {
                              var experiment = experiments[index];
                              return RequestCard(
                                experiment: experiment,
                              );
                            })
                        : const Center(
                            child: Text('No recent requested experiments',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 18)),
                          ),
                  ],
                ));
          } else {
            return const Center(
                child: CircularProgressIndicator());
          }
        });
    // Column(
    //   children: [
    //     RequestCard(index: 1, status: 'accepted'),
    //     const SizedBox(
    //       height: 32,
    //     ),
    //     RequestCard(index: 2, status: 'rejected'),
    //     const SizedBox(
    //       height: 32,
    //     ),
    //     RequestCard(index: 0, status: 'in progress')
    //     // ListView.builder(
    //     //   physics: const NeverScrollableScrollPhysics(),
    //     //   shrinkWrap: true,
    //     //   itemCount: 2,
    //     //   itemBuilder: (context, index) => RequestCard(index: index, status: status),
    //     // )
    //   ],
    // );
  }
}
