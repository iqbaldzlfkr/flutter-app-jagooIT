import 'package:flutter/material.dart';
import 'package:flutter_app/shared/theme.dart';
import 'package:flutter_app/widgets/dummy_column_item.dart';
import 'package:flutter_app/widgets/dummy_row_item.dart';

class DummySecondPage extends StatelessWidget {
  const DummySecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: TabBar(
            labelColor: blueColor,
            unselectedLabelColor: greyColor,
            tabs: [
              Tab(
                child: Text(
                  'ListView',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'GridView',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: 5,
              itemBuilder: (context, index) {
                return const DummyColumnItem();
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12,
              ),
              child: GridView.builder(
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: const DummyRowItem(text: '1st image'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
