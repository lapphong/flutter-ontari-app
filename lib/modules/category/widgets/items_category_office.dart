import 'package:flutter/material.dart';

import '../../../themes/text_style.dart';
import '../../../widgets/stateless/common_bodyitem.dart';

class ItemsCategoryOffice extends StatelessWidget {
  const ItemsCategoryOffice({
    Key? key,
    this.assetName,
    this.title,
    this.name,
  }) : super(key: key);

  final String? assetName, title, name;

  @override
  Widget build(BuildContext context) {
    return BodyItemAsset(
      assetName: assetName!,
      widthImg: 64,
      height: 64,
      mid: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: TxtStyle.titleItemActivity,
              ),
              Text(
                name!,
                style: TxtStyle.headline6MediumGrey,
              ),
            ],
          ),
        ),
      ),
      //childImg: ,
      right: const Text(''),
    );
  }
}