import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;

  
ResponsiveLayout({required this.mobileBody, required this.tabletBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, Constraints) {
        if (Constraints.maxWidth < 600) {
          return mobileBody;
        } else {
          return tabletBody;
        }
      },
    );
  }
}
