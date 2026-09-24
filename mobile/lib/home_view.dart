import 'package:flutter/material.dart';
import 'package:mobile/widgets/custom_button.dart';
import 'package:mobile/widgets/custom_form_field.dart';

import 'constants/constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height * 0.16,
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Line up \nWithout the line",
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800],
                          ),
                        ),
                        Transform.rotate(
                          angle: 0.77, // radians
                          child: Image.asset(
                            burstAccent,
                            width: 55,
                            height: 55,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              "Skip the crowd,wait your way.",
                              maxLines: 3,
                              overflow: TextOverflow.clip,
                              style: theme.textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: titleBlue,
                              ),
                            ),
                          ),
                          Transform.rotate(
                            angle: 0.77, // radians
                            child: Image.asset(
                              burstAccent,
                              width: 62,
                              height: 62,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Enter Your Code",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: titleBlue,
                ),
              ),
              CustomFormField(
                textColor: Colors.blue[900],
                inputFontWeight: FontWeight.w900,
              ),
              CustomButton(
                buttonText: "Join Queue",
                buttonColor: theme.colorScheme.secondary,
                suffixIcon: Icons.arrow_right_alt_outlined,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 3,
                children: [
                  Expanded(child: Divider(thickness: 2)),
                  Text("OR"),
                  Expanded(child: Divider(thickness: 2)),
                ],
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                height: 78,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withAlpha(40),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_scanner_rounded,
                      color: theme.colorScheme.primary,
                      size: 50,
                    ),
                    Text(
                      "Scan QR Code",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: titleBlue,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
