// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:tapparelle/splitBody.dart';
import 'package:tapparelle/components.dart';
import 'package:tapparelle/routeGenerator.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter tapparelle',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: Scaffold(
        appBar: Components().navBar("Tapparelle"),
        body: spli_body(),
      ),
    );
  }
}
