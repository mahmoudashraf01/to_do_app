import 'package:flutter/material.dart';
import 'package:to_do/themes/colors.dart';
import 'package:to_do/themes/text.dart';
import 'package:to_do/widgets/custom_buttoms.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCansel,
  });

  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCansel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      content: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                style: bodyBold.merge(
                  TextStyle(color: black),
                ),
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  labelText: 'Add A New Task',
                  labelStyle: title2Bold.merge(
                    TextStyle(color: black),
                  ),
                ),
              ),
              //Adding both Save & Cansel buttons
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyButton(text: 'Save', onPressed: onSave),
                    const SizedBox(
                      width: 6,
                    ),
                    MyButton(text: 'Cansel', onPressed: onCansel),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
