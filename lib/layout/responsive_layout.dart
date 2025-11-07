import 'package:flutter/material.dart';

class DesktopResponsiveLayout extends StatelessWidget {
  final Widget compactView;
  final Widget normalView;
  final Widget wideView;
  const DesktopResponsiveLayout({
    super.key,
    required this.compactView,
    required this.normalView,
    required this.wideView,
  });

  static const double compactWidth = 900;
  static const double wideWidth = 1440;

  @override
  Widget build(BuildContext context) {
    // BreakPoints for different screen sizes

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final scaleFactor = _calculateScale(width);

        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(scaleFactor)),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _layout(width),
          ),
        );
      },
    );
  }

  Widget _layout(double width) {
    if (width < compactWidth) {
      return compactView;
    } else if (width < wideWidth) {
      return normalView;
    } else {
      return wideView;
    }
  }
}

double _calculateScale(double width) {
  if (width < 800) {
    return 0.9;
  } else if (width < 1440) {
    return 1.0;
  } else if (width < 2000) {
    return 1.1;
  }
  return 1.25;
}
