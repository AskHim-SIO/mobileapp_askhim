import 'package:ap4_askhim/components/rounded_buttons.dart';
import 'package:flutter/material.dart';

import '../Screens/ModifProfile/components/input_basic_form.dart';

Future<dynamic> modalBottomSheet(BuildContext context, double height,
    Color color, TextEditingController controller, String title,String hint,String titleInput,String buttonInput,Function press) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (modal) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              constraints: BoxConstraints(
                maxHeight: height - 80,
              ),
              margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(9.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0, left: 7),
                            child: Text(
                              title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                                controller.clear();
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputBasicForm(
                      textInputType: TextInputType.number,
                        hintText: hint,
                        labelText: titleInput,
                        borderRadius: 10,
                        controller: controller),
                    const SizedBox(height: 10),
                    RoundedButton(
                        text: buttonInput, sizeButton: 0.4, press: () {
                      press();
                    })
                  ],
                ),
              ))
        ],
      );
    },
  );
}
