import 'package:flutter/material.dart';
import 'package:tapparelle/components.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tapparelle/function.dart';
import 'package:tapparelle/button.dart';

// ignore: camel_case_types

class spli_body extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<spli_body> {
  late Utils
      webFunc; //costruttore per fare le richieste web (inizializzato nel metodo build)

  FutureBuilder<String> status(String name) {
    return FutureBuilder(
      future: webFunc.status(name),
      builder: (
        BuildContext context,
        AsyncSnapshot<String> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SpinKitThreeInOut(
            color: Colors.grey,
            size: 40,
          );
        } else if (snapshot.hasError) {
          return const Icon(
            Icons.error,
            color: Colors.red,
            size: 40,
          );
        } else if (snapshot.hasData) {
          return Icon(Components().roomStatus(snapshot.data), size: 40);
        }
        return const SpinKitThreeInOut(
          color: Colors.grey,
          size: 40,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    webFunc = Utils();
    return Scaffold(
        body: Column(children: [
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Casa",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            const Image(
              image: AssetImage('assets/images/house.png'),
              height: 150,
              width: 150,
            ),
            Row(
              children: [
                const Spacer(),
                UpDownButton(
                    onClickUp: () => webFunc.up("home"),
                    onClickDown: () => webFunc.down("home")),
                const Spacer(),
              ],
            ),
            status("home"),
          ],
        ),
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.only(top: 20),
      ),
      Row(
        children: [
          Container(
            child: Column(
              children: [
                const Text(
                  "Cucina",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/room', arguments: 0)
                        .then((value) => setState(() {}));
                  },
                  icon: Image.asset('assets/images/kitchen.png'),
                  iconSize: 120,
                ),
                UpDownButton(
                    onClickUp: () => webFunc.up("kitchen"),
                    onClickDown: () => webFunc.down("kitchen")),
                status("kitchen"),
              ],
            ),
            margin: const EdgeInsets.all(30),
          ),
          Container(
            child: Column(
              children: [
                const Text(
                  "Sala",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/room', arguments: 2);
                  },
                  icon: Image.asset('assets/images/livingroom.png'),
                  iconSize: 120,
                ),
                UpDownButton(
                    onClickUp: () => webFunc.up("livingroom"),
                    onClickDown: () => webFunc.down("livingroom")),
                status("livingroom"),
              ],
            ),
            margin: const EdgeInsets.all(30),
          ),
        ],
      ),
    ]));
  }
}
