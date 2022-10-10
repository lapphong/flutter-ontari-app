import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';

import '../../routes/route_name.dart';
import '../stateless/common_button.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<String> pages = [
      RouteName.commonWidgetPage,
      RouteName.fullScreenPage,
      RouteName.fullPageBloc,
      RouteName.splash,
      RouteName.signInPage,
      RouteName.signUpPage,
      RouteName.verifyYourPage,
      RouteName.selectPlanPage,
      RouteName.homePage,
      RouteName.activityPage,
      RouteName.categoryPage,
      RouteName.detailMentorPage,
      RouteName.playingCoursePage,
      RouteName.settingPage,
      RouteName.languagePage,
      RouteName.downloadVideoPage,
      RouteName.editProfilePage,
      RouteName.favoritePage,
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: pages
                  .map((e) => Builder(
                      builder: (context) => Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: ClassicButton(
                              height: size.height / 15,
                              width: size.width,
                              widthRadius: 0,
                              colorRadius: DarkTheme.white,
                              color: DarkTheme.greyScale800,
                              radius: 20,
                              onTap: () {
                                Navigator.pushNamed(context, e);
                              },
                              child: Center(child: Text(e)),
                            ),
                          )))
                  .toList()),
        ),
      ),
    );
  }
}
