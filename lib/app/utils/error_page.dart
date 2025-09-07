import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final Function? onTap;
  final String? message;
  const ErrorPage({this.message, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 30,
        ),
        Text(message != null ? message! : 'There is an error',
            style: TextStyle(color: Colors.white, fontSize: 15)),
        SizedBox(
          height: 30,
        ),
        onTap != null ? GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!.call();
            }
          },
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white, width: 2)),
            child: Center(
              child: Text(
                'Try Again',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ) : SizedBox.shrink()
      ],
    );
  }
}
