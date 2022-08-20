import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ontari_app/modules/category/widgets/category_office.dart';

import '../../../config/themes/app_color.dart';
import '../../../config/themes/text_style.dart';
import '../../../constants/assets_path.dart';
import '../../../models/model_local.dart';
import '../../../widgets/stateless/common_avatar.dart';
import '../../../widgets/stateless/common_button.dart';
import '../../../widgets/stateless/common_textfield.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitleCategory(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: TextFieldSearchBar(
                    hintText: 'Search your focus...',
                    childPrefixIcon: CustomAvatar(
                      width: 16,
                      height: 16,
                      assetName: AssetPath.iconSearch,
                    ),
                  ),
                ),
                const Text(
                  'Category',
                  style: TxtStyle.headline3SemiBoldWhite,
                ),
                buildListView(category),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView buildListView(List<ModelGeneral> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CategoryOffice(
            assetIcon: list[index].imageUrl,
            title: list[index].title,
            countMentor: list[index].name,
          ),
        );
      },
    );
  }

  SizedBox buildTitleCategory() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Category', style: TxtStyle.titlePage),
          SquareButton(
            bgColor: DarkTheme.greyScale800,
            edge: 40,
            radius: 10,
            child: ImageIcon(
              size: 13,
              color: DarkTheme.white,
              AssetImage(AssetPath.iconBell),
            ),
          ),
        ],
      ),
    );
  }
}
