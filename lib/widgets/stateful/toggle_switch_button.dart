import 'package:flutter/cupertino.dart';

import '../../themes/app_color.dart';

class ToggleSwitchButton extends StatefulWidget {
  const ToggleSwitchButton({
    Key? key,
    this.value = false,
    this.onChanged,
  }) : super(key: key);
  final bool value;
  final Function(bool)? onChanged;

  @override
  State<ToggleSwitchButton> createState() => _ToggleSwitchButtonState();
}

class _ToggleSwitchButtonState extends State<ToggleSwitchButton> {

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        value: widget.value,
        activeColor: DarkTheme.primaryBlue600,
        onChanged: widget.onChanged,
      ),
    );
  }
}
