// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tapparelle/function.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tapparelle/button.dart';
import 'package:http/http.dart' as http;
import 'package:tapparelle/components.dart';

class Room extends StatefulWidget {
  final int ID;
  const Room({required this.ID});
  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  String? doorStatus, windStatus;
  late String roomName;
  // late FutureBuilder doorStatusWidget;
  // late FutureBuilder windStatusWidget;

  @override
  void initState() {
    roomName = (widget.ID == 0) ? "Cucina" : "Sala";
    getInitState();
    super.initState();
  }

  void getInitState() {
    Utils()
        .status((1 + widget.ID).toString())
        .then((value) => setState(() => doorStatus = value));
    Utils()
        .status((2 + widget.ID).toString())
        .then((value) => setState(() => windStatus = value));
  }

  // FutureBuilder<String> status(int ID, int room) {
  //   return FutureBuilder<String>(
  //     future: Utils().status((ID + room).toString()),
  //     builder: (
  //       BuildContext context,
  //       AsyncSnapshot<String> snapshot,
  //     ) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         if (ID == 1) {
  //           Future.delayed(Duration.zero, () async {
  //             setState(() {
  //               doorStatus = snapshot.data;
  //             });
  //           });
  //         } else {
  //           windStatus = snapshot.data;
  //         }
  //         return Components().tappStatus(snapshot.data);
  //       } else if (snapshot.hasError) {
  //         return const Icon(
  //           Icons.error,
  //           color: Colors.red,
  //           size: 100,
  //         );
  //       }
  //       return const SizedBox(
  //         child: SpinKitThreeInOut(
  //           color: Colors.grey,
  //           size: 50,
  //         ),
  //         width: 135,
  //         height: 135,
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    void update(http.Response response) {
      if (response.statusCode == 200) {
        setState(() {});
      }
    }

    return Scaffold(
      appBar: Components().navBar(roomName),
      body: LayoutBuilder(builder: (context, constraints) {
        print(doorStatus);
        return Row(
          children: [
            Container(
              child: Column(
                children: [
                  const Text(
                    "Porta",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  if (doorStatus == null)
                    const SizedBox(
                      child: SpinKitThreeInOut(
                        color: Colors.grey,
                        size: 50,
                      ),
                      width: 135,
                      height: 135,
                    )
                  else
                    Components().tappStatus(doorStatus),
                  UpDownButton(
                    upEnable: !(doorStatus == 'up'),
                    downEnable: !(doorStatus == 'down'),
                    onClickUp: () {
                      Utils()
                          .up((1 + widget.ID).toString())
                          .then((value) => update(value))
                          .whenComplete(() {
                        setState(() => doorStatus = null);
                        Utils().status((1 + widget.ID).toString()).then(
                            (value) => setState(() => doorStatus = value));
                      });
                    },
                    onClickDown: () {
                      Utils()
                          .down((1 + widget.ID).toString())
                          .then((value) => update(value))
                          .whenComplete(() {
                        setState(() => doorStatus = null);
                        Utils().status((1 + widget.ID).toString()).then(
                            (value) => setState(() => doorStatus = value));
                      });
                    },
                  ),
                ],
              ),
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.only(top: 20),
            ),
            Container(
              child: Column(
                children: [
                  const Text(
                    "Finestra",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  if (windStatus == null)
                    const SizedBox(
                      child: const SpinKitThreeInOut(
                        color: Colors.grey,
                        size: 50,
                      ),
                      width: 135,
                      height: 135,
                    )
                  else
                    Components().tappStatus(windStatus),
                  UpDownButton(
                    upEnable: !(windStatus == 'up'),
                    downEnable: !(windStatus == 'down'),
                    onClickUp: () {
                      Utils()
                          .up((2 + widget.ID).toString())
                          .then((value) => update(value))
                          .whenComplete(() {
                        setState(() => windStatus = null);
                        Utils().status((2 + widget.ID).toString()).then(
                                (value) => setState(() => windStatus = value));
                      });
                    },
                    onClickDown: () {
                      Utils()
                          .down((2 + widget.ID).toString())
                          .then((value) => update(value))
                          .whenComplete(() {
                        setState(() => windStatus = null);
                        Utils().status((2 + widget.ID).toString()).then(
                                (value) => setState(() => windStatus = value));
                      });
                    },
                  ),
                ],
              ),
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.only(top: 20),
            ),
          ],
        );
      }),
    );
  }
}
