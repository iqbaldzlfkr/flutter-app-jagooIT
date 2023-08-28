import 'package:flutter/material.dart';
import 'package:flutter_app/cubit/input_validation_cubit.dart';
import 'package:flutter_app/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputValidationPage extends StatefulWidget {
  const InputValidationPage({super.key});

  @override
  State<InputValidationPage> createState() => _InputValidationPageState();
}

class _InputValidationPageState extends State<InputValidationPage> {
  bool isErrorEmail = false;
  bool isErrorName = false;
  bool isSuccessValidation = false;
  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InputValidationCubit(),
      child: BlocConsumer<InputValidationCubit, InputValidationState>(
        listener: (context, state) {
          if (state is InputValidationEmailFailed) {
            setState(() {
              isErrorEmail = true;
              isSuccessValidation = false;
            });
          }
          if (state is InputValidationNameFailed) {
            setState(() {
              isErrorName = true;
              isSuccessValidation = false;
            });
          }
          if (state is InputValidationEmailSuccess) {
            setState(() {
              isErrorEmail = false;
            });
          }
          if (state is InputValidationNameSuccess) {
            setState(() {
              isErrorName = false;
            });
          }
          if (state is InputValidationSuccess) {
            setState(() {
              isSuccessValidation = true;
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                'Input Validation',
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
            body: Container(
              margin: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isSuccessValidation ? 'Hi ${ctrlName.text}' : 'Hi There!',
                    style: blueTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    isSuccessValidation
                        ? 'Your email was ${ctrlEmail.text}'
                        : 'Please enter your name and email :)',
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Name',
                              style: blackTextStyle,
                            ),
                            Text(
                              ' *',
                              style: redTextStyle,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextFormField(
                          controller: ctrlName,
                          decoration: InputDecoration(
                            hintText: 'Enter your name...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            contentPadding: const EdgeInsets.all(12),
                            prefixIcon: Icon(
                              Icons.person_2_outlined,
                              color: blueColor,
                            ),
                            errorText:
                                isErrorName ? 'Name cannot be empty' : null,
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
                          height: 4,
                        ),
                        TextFormField(
                          controller: ctrlEmail,
                          decoration: InputDecoration(
                            hintText: 'Enter your email...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            contentPadding: const EdgeInsets.all(12),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: blueColor,
                            ),
                            errorText:
                                isErrorEmail ? 'Email cannot be empty' : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: Container(
              width: MediaQuery.of(context).size.width - 64,
              height: 53,
              margin: const EdgeInsets.only(
                right: 16,
                left: 16,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Material(
                  child: InkWell(
                    onTap: () => context
                        .read<InputValidationCubit>()
                        .signIn(email: ctrlEmail.text, name: ctrlName.text),
                    child: Container(
                      color: blueColor.withOpacity(0.3),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: blueTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: extraBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
