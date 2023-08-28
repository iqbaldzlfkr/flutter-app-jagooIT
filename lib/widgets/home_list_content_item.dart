import 'package:flutter/material.dart';
import 'package:flutter_app/shared/theme.dart';

class HomeListContentItem extends StatelessWidget {
  final String title;
  final String body;
  final VoidCallback? onTap;
  const HomeListContentItem({
    super.key,
    required this.title,
    required this.body,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(top: 8, right: 16, left: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: greyColor),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blueTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  body,
                  style: greyTextStyle,
                ),
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: const Icon(
                  Icons.keyboard_arrow_right_sharp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
