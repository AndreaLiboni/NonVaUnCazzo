// ignore_for_file: no_logic_in_create_state, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class UpDownButton extends StatefulWidget {
  final bool upEnable, downEnable;
  final Function onClickUp, onClickDown;
  const UpDownButton({
    required this.onClickUp,
    this.upEnable = true,
    required this.onClickDown,
    this.downEnable = true,
  });
  @override
  UpDownButtonState createState() => UpDownButtonState(
      onClickUp: onClickUp,
      upEnable: upEnable,
      onClickDown: onClickDown,
      downEnable: downEnable);
}

class UpDownButtonState extends State<UpDownButton> {
  final bool upEnable, downEnable;
  final Function onClickUp, onClickDown;
  UpDownButtonState({
    required this.onClickUp,
    this.upEnable = true,
    required this.onClickDown,
    this.downEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: upEnable ? () => (onClickUp()) : null,
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(6),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(4)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  upEnable ? Colors.orange : Colors.grey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(18.0)),
                      side: BorderSide(color: Colors.black)))),
          child: const Icon(
            Icons.arrow_upward,
            color: Colors.white,
            size: 32,
          ),
        ),
        TextButton(
            onPressed: downEnable ? () => (onClickDown()) : null,
            style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(6),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(4)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    downEnable ? Colors.orange : Colors.grey),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(18.0)),
                        side: BorderSide(color: Colors.black)))),
            child: const Icon(
              Icons.arrow_downward,
              color: Colors.white,
              size: 32,
            )),
      ],
    );
  }
}
