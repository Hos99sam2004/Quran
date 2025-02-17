import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const Color DarkPurple = Color(0xFF300759);
const Color TextColor = Color(0xFF7B15BF);
const Color Button = Color(0xFF9D1DF2);
const Color IconColor = Color(0xFFCD77F2);
const Color Background = Color(0xFFE5B6F2);
const Color white = Color(0xFFffffff);

// class ScreenSize {
//   static double height = 0.0;
//   static double width = 0.0;

//   // هذه الطريقة تقوم بتحديث القيم
//   static void setScreenSize(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//   }
// }

void ShowToast({required String text, required ToastState state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState {
  SUCCESS,
  ERROR,
  WARNING,
}

Color? ToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    // TODO: Handle this case.
    case ToastState.ERROR:
      color = Colors.red;
      break;
    // TODO: Handle this case.
    case ToastState.WARNING:
      color = Colors.amber;
      break;
    // TODO: Handle this case.
  }
  return color;
}

goto(BuildContext context, Widget destination) {
  print("success");
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // البداية من الجهة اليمنى
        const end = Offset.zero; // النهاية في المكان الحالي
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    ),
  );
}
