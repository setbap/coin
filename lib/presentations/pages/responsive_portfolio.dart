import 'package:bloc_header/presentations/widget/responsive_builder.dart';
import 'package:flutter/material.dart';

class ResponsivePortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ResponsiveBuilder.isSmallDevice(context)
          ? Drawer(
              child: ListView(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.face_unlock_rounded),
                    color: Theme.of(context).accentColor,
                  ),
                  IconButton(
                    onPressed: () {},
                    color: Theme.of(context).accentColor,
                    icon: Icon(Icons.face_unlock_rounded),
                  ),
                ],
              ),
            )
          : null,
      appBar: AppBar(
        elevation: 0,
        title: Text("Sina"),
        actions: [
          ResponsiveBuilder(
            largeScreen: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.face_unlock_rounded),
                  color: Theme.of(context).accentColor,
                ),
                IconButton(
                  onPressed: () {},
                  color: Theme.of(context).accentColor,
                  icon: Icon(Icons.face_unlock_rounded),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
