import 'package:flutter/material.dart';
import 'package:flutter_app/shared/theme.dart';

// class CustomFilledButton extends StatelessWidget {
//   final String title;
//   final double width;
//   final double height;
//   final VoidCallback? onPressed;

//   const CustomFilledButton({
//     Key? key,
//     required this.title,
//     this.width = double.infinity,
//     this.height = 40,
//     this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(8),
//         child: TextButton(
//           onPressed: onPressed,
//           style: TextButton.styleFrom(
//             backgroundColor: blueColor.withOpacity(0.3),
//           ),
//           child: Text(
//             title,
//             style: blueTextStyle.copyWith(
//               fontSize: 16,
//               fontWeight: extraBold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onTap;

  const CustomButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 40,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          child: Container(
            color: blueColor.withOpacity(0.3),
            child: Center(
              child: Text(
                title,
                style: blueTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: extraBold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
