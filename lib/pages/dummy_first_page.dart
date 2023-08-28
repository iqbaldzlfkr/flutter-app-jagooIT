import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/shared/button.dart';
import 'package:flutter_app/shared/theme.dart';
import 'package:flutter_app/widgets/dummy_column_item.dart';
import 'package:flutter_app/widgets/dummy_row_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DummyFirstPage extends StatelessWidget {
  const DummyFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Dummy UI',
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/dummy-second');
                },
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Next',
                          style: blueTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Tab Bar, GridView, ListView',
                          style: greyTextStyle,
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_right_sharp,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'CONTAINER AND TEXT',
                style: greenTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: extraBold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const DummyColumnItem(),
              const SizedBox(
                height: 12,
              ),
              Text(
                'COLUMN',
                style: greenTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: extraBold,
                ),
              ),
              Column(
                children: const [
                  DummyColumnItem(),
                  DummyColumnItem(),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'ROW',
                style: greenTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: extraBold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    DummyRowItem(
                      text: '1st Image',
                    ),
                    DummyRowItem(
                      text: '2nd Image',
                    ),
                    DummyRowItem(
                      text: '3rd Image',
                    ),
                    DummyRowItem(
                      text: '3rd Image',
                    ),
                    DummyRowItem(
                      text: '3rd Image',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'BUTTON',
                style: greenTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: extraBold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFilledButton(
                title: 'Press Me',
                onPressed: () {},
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'INPUT',
                style: greenTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: extraBold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    'Email',
                    style: blackTextStyle,
                  ),
                  Text(
                    ' *',
                    style: redTextStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: blueColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'IMAGE ASSET, SIZED BOX & EXPANDED',
                style: greenTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: extraBold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
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
                        children: [
                          SvgPicture.asset('assets/img_2.svg'),
                          const Text('1st Image'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
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
                      children: [
                        SvgPicture.asset('assets/img_2.svg'),
                        const Text('2nd Image'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
