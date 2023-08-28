import 'package:flutter/material.dart';
import 'package:flutter_app/shared/theme.dart';
import 'package:flutter_app/widgets/home_list_content_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Choose Section',
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              HomeListContentItem(
                title: 'Dummy UI',
                body: 'Practice flutter UI and get familiar with\nUI Widgets',
                onTap: () {
                  Navigator.pushNamed(context, '/dummy-first');
                },
              ),
              HomeListContentItem(
                title: 'Simple Calculator',
                body:
                    'Creating calculator app that consists\nadd, divide, substract, multiply function',
                onTap: () {
                  Navigator.pushNamed(context, '/calculator');
                },
              ),
              HomeListContentItem(
                title: 'Input Validation',
                body: 'Play around with email input & \npassword input',
                onTap: () {
                  Navigator.pushNamed(context, '/input-validation');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
