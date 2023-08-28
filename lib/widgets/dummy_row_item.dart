import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DummyRowItem extends StatelessWidget {
  final String text;
  const DummyRowItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xffD9D9D9),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/img_2.svg'),
          Text(text),
        ],
      ),
    );
  }
}
