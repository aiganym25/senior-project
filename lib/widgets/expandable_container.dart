import 'package:flutter/material.dart';
class ExpandableContainer extends StatefulWidget {
  final Widget body;
  final String title;
  const ExpandableContainer({required this.title, required this.body, Key? key})
      : super(key: key);

  @override
  State<ExpandableContainer> createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _isExpanded = !isExpanded;
        });
      },
      animationDuration: const Duration(milliseconds: 300),
      elevation: 3,
      children: [
        ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 17),
                ),
              );
            },
            body: widget.body,
            isExpanded: _isExpanded,
            canTapOnHeader: true)
      ],
    );
  }
}
