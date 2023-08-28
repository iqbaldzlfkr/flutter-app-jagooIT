import 'package:flutter/material.dart';
import 'package:flutter_app/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DummyColumnItem extends StatelessWidget {
  const DummyColumnItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 16,),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xffD9D9D9),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/img_2.svg',
            width: 50,
          ),
          const SizedBox(
            width: 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How can I be Flutter \nDeveloper Expert?',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    'Jill Lepore',
                    style: greyTextStyle,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(
                    Icons.circle,
                    size: 5,
                    color: Color(0xff898989),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '23 May 23',
                    style: greyTextStyle,
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              alignment: Alignment.bottomRight,
              // color: redColor,
              child: SvgPicture.asset(
                'assets/ic_star.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
