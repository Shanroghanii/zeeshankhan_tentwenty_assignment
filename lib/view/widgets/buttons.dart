import 'package:flutter/material.dart';

import '../../utils/color.dart';

class ElevatedButtonW extends StatelessWidget {
  final Color? buttonColor;
  final Color? buttonTextColor;
  final String buttonText;
  final String? buttonIconPath;
  final Color? borderColor;
  final Function()? ontap;
  final double? buttonRadius;
  final bool? isFloatButton;
  final double? height;
  const ElevatedButtonW({
    Key? key,
    required this.buttonText,
    this.ontap,
    this.buttonColor,
    this.buttonIconPath,
    this.buttonTextColor,
    this.borderColor,
    this.buttonRadius,
    this.isFloatButton,
    this.height,
  }) : super(key: key);

  // final appController = AppController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: height ?? 55,
        child: isFloatButton ?? false
            ? Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: ontap,
                  child: const Icon(Icons.add),
                ),
              )
            : ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(Size.zero), // Set this
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor:
                        MaterialStateProperty.all(buttonColor ?? blueColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(buttonRadius ?? 14.0),
                            side: BorderSide(
                                color:
                                    borderColor ?? buttonColor ?? blueColor)))),
                onPressed: ontap,
                child: Text(
                  buttonText,
                  style: TextStyle(color: buttonTextColor ?? backgroundColor),
                ),
              ),
      ),
    );
  }
}
