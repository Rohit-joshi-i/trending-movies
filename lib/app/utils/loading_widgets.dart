import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: LoadingAnimationWidget.threeArchedCircle(
              color: Colors.white, size: 80),
        ),
        SizedBox(
          height: 50,
        ),
        Text('Popcorn’s ready, fetching the blockbusters…')
      ],
    );
  }
}
