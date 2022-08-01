import 'package:flutter/material.dart';

Widget customLoaderWidget({bool isLoaderisible = false}) => Visibility(
      visible: isLoaderisible,
      child: Container(
        color: Colors.black26,
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: CircularProgressIndicator(),
        ),
      ),
    );
