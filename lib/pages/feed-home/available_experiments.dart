import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/providers/experiment_mv.dart';
import 'package:senior_project/pages/providers/request_mv.dart';
import 'package:senior_project/widgets/cards/joinable_card.dart';
import 'package:senior_project/repo/api_client.dart';


class AvailableExperiments extends StatefulWidget {
  const AvailableExperiments({Key? key}) : super(key: key);

  @override
  State<AvailableExperiments> createState() => _AvailableExperimentsState();
}

class _AvailableExperimentsState extends State<AvailableExperiments> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  final _apiClient = ApiClient();

  @override
  Widget build(BuildContext context) {
    bool isShow = context.select((RequestedExperimentsMV mv) => mv.isShow);


    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 50.0,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(222, 222, 222, 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          
                          hintText: 'Search by email',
                          hintStyle: TextStyle(fontSize: 18),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search, size: 30),
                      onPressed: () {
                        print(isShow);
                        _apiClient.getToken();
                        Provider.of<RequestedExperimentsMV>(context,
                                listen: false)
                            .changeShowStatus();
                        // widget.onSearch(_controller.text);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              isShow == true
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return const JoinableCard();
                      },
                    )
                  : const Text('No available experiments',
                      style: TextStyle(color: Colors.grey, fontSize: 18))
            ],
          ),
        ));
  }
}
