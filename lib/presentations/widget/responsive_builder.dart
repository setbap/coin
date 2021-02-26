import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  final Widget defualtScreen;
  static const smallDeviceWidth = 400;
  static const mediumDeviceWidth = 800;

  const ResponsiveBuilder({
    Key key,
    this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
    this.defualtScreen,
  }) : super(key: key);

  static bool isSmallDevice(BuildContext context) =>
      MediaQuery.of(context).size.width < smallDeviceWidth;

  static bool isMediumDevice(BuildContext context) =>
      MediaQuery.of(context).size.width > smallDeviceWidth &&
      MediaQuery.of(context).size.width < mediumDeviceWidth;

  static bool isLargeDevice(BuildContext context) =>
      MediaQuery.of(context).size.width > mediumDeviceWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > mediumDeviceWidth) {
          return largeScreen ?? defualtScreen ?? Container();
        }
        if (constraints.maxWidth > smallDeviceWidth) {
          return mediumScreen ?? defualtScreen ?? Container();
        }
        return smallScreen ?? defualtScreen ?? Container();
      },
    );
  }
}
