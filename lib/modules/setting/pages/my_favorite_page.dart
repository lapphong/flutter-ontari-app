import 'package:flutter/material.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/setting/widgets/items_my_favorite.dart';
import 'package:ontari_app/modules/setting/widgets/title_setting.dart';


class MyFavoritePage extends StatelessWidget {
  const MyFavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleSetting(title: 'My Favorite'),
              buildListView(myFavorite),
            ],
          ),
        ),
      )),
    );
  }

  ListView buildListView(List<ModelGeneral> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ItemsMyFavorite(
            assetName: list[index].imageUrl,
            title: list[index].title,
            name: list[index].name,
            onTap: () {
              //print('Dang click item:${list[index]}');
            },
          ),
        );
      },
    );
  }
}
