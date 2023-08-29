import 'package:flutter/material.dart';
import 'package:flutter_app/models/history_model.dart';
import 'package:flutter_app/shared/button.dart';
import 'package:flutter_app/shared/theme.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  List<HistoryModel> historyList = [];

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  String opertaionSymbol = '';
  String result = '';
  String notificationMessage = '';
  double lastNum1 = 0;
  double lastNum2 = 0;

  void setSymbol(String symbol) {
    setState(() {
      opertaionSymbol = symbol;
      result = '';
    });
  }

  void calculateResult() {
    if (opertaionSymbol.isNotEmpty) {
      if (controller1.text.isEmpty) {
        setState(() {
          notificationMessage = 'Left form cannot be empty';
          result = '';
        });
      } else if (controller2.text.isEmpty) {
        setState(() {
          notificationMessage = 'Right form cannot be empty';
          result = '';
        });
      } else {
        double num1 = double.tryParse(controller1.text) ?? 0;
        double num2 = double.tryParse(controller2.text) ?? 0;
        double calculatedResult = 0.0;

        if (opertaionSymbol == '+') {
          calculatedResult = num1 + num2;
        } else if (opertaionSymbol == '-') {
          calculatedResult = num1 - num2;
        } else if (opertaionSymbol == 'x') {
          calculatedResult = num1 * num2;
        } else if (opertaionSymbol == '/') {
          if (num2 != 0) {
            calculatedResult = num1 / num2;
          } else {
            calculatedResult = double.infinity;
          }
        }
        setState(() {
          result = calculatedResult.toStringAsFixed(0);
          lastNum1 = num1;
          lastNum2 = num2;
          notificationMessage = '';
          // historyList.add('${num1.toInt()} $opertaionSymbol ${num2.toInt()}');
          historyList.add(
              HistoryModel(num1: num1, operation: opertaionSymbol, num2: num2));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Simple Calculator',
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
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CHOOSE TYPE',
                style: greenTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: extraBold,
                ),
              ),
              Wrap(
                spacing: 20,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setSymbol('+');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: opertaionSymbol == '+'
                          ? blueColor.withOpacity(0.3)
                          : whiteColor,
                    ),
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 17,
                        color: opertaionSymbol == '+' ? blueColor : blackColor,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setSymbol('-');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: opertaionSymbol == '-'
                          ? blueColor.withOpacity(0.3)
                          : whiteColor,
                    ),
                    child: Text(
                      'Substract',
                      style: TextStyle(
                        fontSize: 17,
                        color: opertaionSymbol == '-' ? blueColor : blackColor,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setSymbol('x');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: opertaionSymbol == 'x'
                          ? blueColor.withOpacity(0.3)
                          : whiteColor,
                    ),
                    child: Text(
                      'Multiply',
                      style: TextStyle(
                        fontSize: 17,
                        color: opertaionSymbol == 'x' ? blueColor : blackColor,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setSymbol('/');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: opertaionSymbol == '/'
                          ? blueColor.withOpacity(0.3)
                          : whiteColor,
                    ),
                    child: Text(
                      'Divide',
                      style: TextStyle(
                        fontSize: 17,
                        color: opertaionSymbol == '/' ? blueColor : blackColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Visibility(
                visible: opertaionSymbol.isNotEmpty,
                child: Row(
                  children: [
                    SizedBox(
                      width: 71,
                      height: 56,
                      child: TextField(
                        controller: controller1,
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 30,
                      child: Text(
                        opertaionSymbol,
                        textAlign: TextAlign.center,
                        style: blackTextStyle.copyWith(
                          fontSize: 40,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 71,
                      height: 56,
                      child: TextField(
                        controller: controller2,
                        keyboardType: TextInputType.number,
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text(
                        '=',
                        textAlign: TextAlign.center,
                        style: blackTextStyle.copyWith(
                          fontSize: 40,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        result.isNotEmpty ? result : '...',
                        textAlign: TextAlign.center,
                        style: blackTextStyle.copyWith(
                          fontSize: 32,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: opertaionSymbol.isNotEmpty,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(
                    top: 16,
                  ),
                  decoration: BoxDecoration(
                    color: greenColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: greenColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        notificationMessage.isNotEmpty
                            ? notificationMessage
                            : 'Press calculate button to get the result',
                        style: TextStyle(
                          color: notificationMessage.isNotEmpty
                              ? redColor
                              : greyColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  'HISTORY',
                  style: greenTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: extraBold,
                  ),
                ),
              ),
              SizedBox(
                height: 320,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: historyList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Row(
                            children: [
                              Text(
                                historyList[index].num1.toStringAsFixed(0),
                                style: blackTextStyle.copyWith(
                                    fontSize: 30, fontWeight: bold),
                              ),
                              Text(
                                historyList[index].operation,
                                style: blackTextStyle.copyWith(
                                    fontSize: 30, fontWeight: bold),
                              ),
                              Text(
                                historyList[index].num2.toStringAsFixed(0),
                                style: blackTextStyle.copyWith(
                                    fontSize: 30, fontWeight: bold),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    controller1.text = historyList[index]
                                        .num1
                                        .toStringAsFixed(0);
                                    controller2.text = historyList[index]
                                        .num2
                                        .toStringAsFixed(0);
                                  });
                                },
                                child: Text(
                                  'Re-Apply',
                                  style: blueTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: greyColor,
                          thickness: 1,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: opertaionSymbol.isNotEmpty,
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: CustomButton(
            title: 'CALCULATE',
            onTap: calculateResult,
          ),
        ),
      ),
    );
  }
}
