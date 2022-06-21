import 'package:fluttertoast/fluttertoast.dart';

// ignore: non_constant_identifier_names
Future<void> GlobalToastWidget({required String message}) async {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
