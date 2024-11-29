import 'package:flutter/material.dart';

class GetStartTextColumn extends StatelessWidget {
  const GetStartTextColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enjoy Your Online',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'PlayfairDisplay',
              fontSize: 32,
              fontWeight: FontWeight.w700),
        ),
        Text(
          'Shopping.',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'PlayfairDisplay',
              fontSize: 32,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
