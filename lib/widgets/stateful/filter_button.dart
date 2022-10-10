import 'package:flutter/material.dart';

import '../../themes/text_style.dart';

class FilterButton extends StatefulWidget {
  final double? height;
  final double? width;
  final String? content;
  final VoidCallback onTap;

  const FilterButton({Key? key, this.height, this.width, this.content,required this.onTap})
      : super(key: key);

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            ),
        child: Text(
          widget.content!,
          style: TxtStyle.headline2Bold,
        ),
      ),
    );
  }
}
