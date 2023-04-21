import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/providers/experiment_mv.dart';

class SearchWidget extends StatefulWidget {
  final Function onChanged;
  final TextEditingController controller; 

  const SearchWidget({
    required this.onChanged,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ExperimentParametersMV>(context);
    // print(model.searchController.text);
    return Container(
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
            onChanged: (val) => widget.onChanged(val),
              controller: widget.controller,
              decoration: const  InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(fontSize: 18),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search, size: 30),
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }
}
