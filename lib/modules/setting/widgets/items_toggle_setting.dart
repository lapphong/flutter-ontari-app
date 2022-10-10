import 'package:flutter/material.dart';

import '../../../assets/assets_path.dart';
import '../../../themes/text_style.dart';
import '../../../widgets/stateful/toggle_switch_button.dart';
import '../../../widgets/stateless/common_bodyitem.dart';

class ItemsToggleSetting extends StatefulWidget {
  const ItemsToggleSetting({
    Key? key,
    this.title,
    this.assetName,
    this.onTap,
    this.onValue = false,
  }) : super(key: key);

  final String? title, assetName;
  final void Function()? onTap;
  final bool onValue;

  @override
  State<ItemsToggleSetting> createState() => _ItemsToggleSettingState();
}

class _ItemsToggleSettingState extends State<ItemsToggleSetting> {
  late bool _onValue = widget.onValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: BodyItemAsset(
        assetName: AssetPath.imgBackgroundItems,
        height: 32,
        widthImg: 32,
        mid: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Center(
            child: Text(
              widget.title!,
              style: TxtStyle.headline4SemiBoldWhite,
            ),
          ),
        ),
        right: Padding(
          padding: const EdgeInsets.only(left: 145.0),
          child: ToggleSwitchButton(
            value: _onValue,
            onChanged: (value) => setState(() => _onValue = value),
          ),
        ),
        child: Center(
          child: Image(
            image: AssetImage(widget.assetName!),
            width: 16,
            height: 16,
          ),
        ),
      ),
    );
  }
}
