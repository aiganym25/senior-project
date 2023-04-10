import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(fontSize: 18),
                border: InputBorder.none,
              ),
              // onEditingComplete:() {
              //   // print(value);
              //   _apiClient.getExperimentsByEmail(_controller.text);
              // },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search, size: 30),
            onPressed: () {
              // Provider.of<RequestedExperimentsMV>(context,
              //         listen: false)
              //     .changeShowStatus();
              // widget.onSearch(_controller.text);
            },
          ),
        ],
      ),
    );
  }
}
