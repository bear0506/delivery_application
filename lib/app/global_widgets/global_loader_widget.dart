import 'package:flutter/material.dart';

class GlobalCustomLoaderWidget extends StatelessWidget {
  const GlobalCustomLoaderWidget({Key? key, this.isLoaderisible = false})
      : super(key: key);

  final bool isLoaderisible;

  @override
  Widget build(BuildContext context) => Visibility(
        visible: isLoaderisible,
        child: Container(
          color: Colors.black26,
          alignment: Alignment.center,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircularProgressIndicator(),
          ),
        ),
      );
}
