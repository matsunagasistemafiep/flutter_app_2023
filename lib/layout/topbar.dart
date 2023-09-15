import 'package:flutter/material.dart';

import '../pages/calc.dart';
import '../pages/second.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Top Navigation"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.calculate)),
              Tab(icon: Icon(Icons.photo_album))
            ]
          )
        ),
        body: TabBarView(
          children: [
            Second(),
            Calc(),
            Container(child: Text("Em Construção"))
          ],
        )
      )
    );
  }

  
}