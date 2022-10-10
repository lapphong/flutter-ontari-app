import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../themes/app_color.dart';

class IndicatorSlider extends StatefulWidget {
  const IndicatorSlider({Key? key, this.edge, this.count}) : super(key: key);
  final double? edge;
  final int? count;

  @override
  State<IndicatorSlider> createState() => _IndicatorSliderState();
}

class _IndicatorSliderState extends State<IndicatorSlider> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: 0,
      count: widget.count!,
      effect: SlideEffect(
        activeDotColor: DarkTheme.primaryBlue900,
        dotColor: DarkTheme.greyScale400,
        dotWidth: widget.edge!,
        dotHeight: widget.edge!,
      ),
    );
  }
}