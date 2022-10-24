import 'package:flutter/material.dart';

import '../../../themes/app_color.dart';
import '../../../widgets/stateless/common_bodyitem.dart';

class ItemLanguage extends StatefulWidget {
  const ItemLanguage({
    Key? key,
    this.assetName,
    this.nameLang,
    this.style,
    this.onTap,
    this.iconChecked,
  }) : super(key: key);

  final String? assetName, nameLang;
  final TextStyle? style;
  final VoidCallback? onTap;
  final Widget? iconChecked;

  @override
  State<ItemLanguage> createState() => _ItemLanguageState();
}

class _ItemLanguageState extends State<ItemLanguage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyItemAsset(
          onTap: widget.onTap,
          assetName: widget.assetName!,
          mid: Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: SizedBox(
              width: 200,
              child: Text(
                widget.nameLang!,
                style: widget.style,
              ),
            ),
          ),
          height: 16,
          radius: 2,
          widthImg: 24,
          right: widget.iconChecked!,
        ),
        const SizedBox(height: 21),
        Divider(color: DarkTheme.greyScale50.withOpacity(0.8)),
      ],
    );
  }
}
