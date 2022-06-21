import 'package:flutter/material.dart';

class GlobalDividerWidget extends StatelessWidget {
  const GlobalDividerWidget({Key? key, this.top = 20, this.bottom = 20})
      : super(key: key);

  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(height: top),
          Divider(thickness: 1, color: Colors.grey.shade200),
          SizedBox(height: bottom),
        ],
      );
}
