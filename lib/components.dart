// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Components {
  Container tappStatus(String? status) {
    double height;
    if (status == "up") {
      height = 103;
    } else if (status == "middle") {
      height = 67;
    } else {
      height = 0;
    }
    return Container(
      width: 135,
      height: 135,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(('assets/images/tapparella_down.png')))),
      child: Container(
        height: height,
        color: Colors.grey[50],
      ),
    );
  }

  IconData roomStatus(String? status) {
    if (status == "up") {
      return Icons.lock_open;
    } else if (status == "down") {
      return Icons.lock;
    }
    return Icons.keyboard_control_outlined;
  }

  AppBar navBar(String roomName) {
    return AppBar(
      centerTitle: true,
      title: Text(
        roomName,
        style: const TextStyle(fontSize: 20),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.elliptical(60, 60))),
      backgroundColor: Colors.orange,
      shadowColor: Colors.orange,
    );
  }
}
