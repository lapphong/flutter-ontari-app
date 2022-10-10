import 'package:flutter/material.dart';
import 'package:ontari_app/modules/category/widgets/category_office.dart';

import '../../../assets/assets_path.dart';
import '../../../themes/app_color.dart';
import '../../../themes/text_style.dart';
import '../../../models/model_local.dart';
import '../../../widgets/stateless/common_avatar.dart';
import '../../../widgets/stateless/common_button.dart';
import '../../../widgets/stateful/common_textfield.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitleCategory(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: TextFieldSearchBar(
                    textController: _searchController,
                    hintText: 'Search your focus...',
                    childPrefixIcon: const CustomAvatar(
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
