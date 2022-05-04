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
  _UpDownButtonState createState() => _UpDownButtonState();
}

class _UpDownButtonState extends State<UpDownButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: widget.upEnable ? () => (widget.onClickUp()) : null,
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(6),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(4)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  widget.upEnable ? Colors.orange : Colors.grey),
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
            onPressed: widget.downEnable ? () => (widget.onClickDown()) : null,
            style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(6),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(4)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    widget.downEnable ? Colors.orange : Colors.grey),
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
