import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/activity/widgets/completed_progress.dart';
import 'package:ontari_app/modules/activity/widgets/items_activity.dart';
import 'package:ontari_app/modules/category/widgets/category_office.dart';
import 'package:ontari_app/modules/category/widgets/items_category_office.dart';
import 'package:ontari_app/modules/details/widgets/items_course.dart';
import 'package:ontari_app/modules/details/widgets/items_subjects.dart';
import 'package:ontari_app/modules/details/widgets/items_subjects_get.dart';
import 'package:ontari_app/modules/setting/widgets/item_account.dart';
import 'package:ontari_app/modules/setting/widgets/items_arrow_setting.dart';
import 'package:ontari_app/modules/setting/widgets/items_download_video.dart';
import 'package:ontari_app/modules/setting/widgets/items_language.dart';
import 'package:ontari_app/modules/setting/widgets/items_my_favorite.dart';
import 'package:ontari_app/modules/setting/widgets/items_toggle_setting.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';

import '../../assets/assets_path.dart';
import '../../widgets/stateful/indicator_slider.dart';
import '../../widgets/stateful/toggle_switch_button.dart';
import '../../widgets/stateless/class_preview.dart';
import '../../widgets/stateless/common_avatar.dart';
import '../../widgets/stateful/common_textfield.dart';
import '../../widgets/stateless/discount.dart';
import '../../widgets/stateless/indicator_home.dart';

import '../../widgets/stateless/mentor.dart';
import '../../widgets/stateless/terms.dart';

class CommonWidgetPage extends StatefulWidget {
  const CommonWidgetPage({Key? key}) : super(key: key);

  @override
  State<CommonWidgetPage> createState() => _CommonWidgetPageState();
}

class _CommonWidgetPageState extends State<CommonWidgetPage> {
  bool check = false;
  late PageController _pageController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      //backgroundColor: DarkTheme.greyScale900,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 50)),
            ClassicButton(
              onTap: () {},
              width: size.width / 1.3,
              radius: 12,
              widthRadius: 0,
              colorRadius: DarkTheme.white,
              height: size.height / 12,
              color: DarkTheme.primaryBlue900,
              child: const Center(child: Text('Sign in')),
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            ClassicButton(
              //onTap: () => print('Size: ${size}'),
              width: size.width / 1.3,
              widthRadius: 0,
              radius: 12,
              height: size.height / 12,
              color: DarkTheme.primaryBlue900,
              colorRadius: DarkTheme.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetPath.iconGoogle,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('Sign In with Google'),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width / 7,
                  height: size.width / 7,
                  child: const CircleButton(
                    widthIcon: 20,
                    heightIcon: 20,
                    bgColor: DarkTheme.primaryBlue900,
                    assetPath: AssetPath.iconPlay,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                SquareButton(
                  edge: size.width / 7,
                  radius: 10,
                  bgColor: DarkTheme.primaryBlue900,
                  child: ImageIcon(
                    color: DarkTheme.white,
                    AssetImage(AssetPath.iconClose),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                ClassicButton(
                  widthRadius: 0.0,
                  width: size.width / 3.5,
                  height: size.width / 15,
                  radius: 7,
                  color: DarkTheme.white,
                  colorRadius: DarkTheme.primaryBlue900,
                  child: const Center(
                      child: Text(
                    'Change Avatar',
                    style: TxtStyle.buttonSmallSemiBold,
                  )),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                IndicatorHome(
                  width: size.width / 4,
                  height: size.width / 90,
                  color: DarkTheme.primaryBlue900,
                  radius: 100,
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClassicButton(
                  width: size.width / 2.4,
                  radius: 12,
                  widthRadius: 0,
                  colorRadius: DarkTheme.white,
                  height: size.height / 12,
                  color: DarkTheme.primaryBlue900,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetPath.iconGoogle,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text('Google'),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                ToggleSwitchButton(),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                const IndicatorSlider(edge: 10, count: 3),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            // CustomTextField(
            //   height: 52,
            //   title: 'Email address',
            //   hintText: 'Enter your email address',
            //   keyboardType: TextInputType.emailAddress,
            //   //assetIcon: AssetPath.iconEmail,
            //   childPrefixIcon: CustomAvatar(
            //     width: size.width / 24,
            //     height: size.width / 30,
            //     assetName: AssetPath.iconEmail,
            //   ),
            // ),
            const TextFieldEmail(
                //emailController: _emailController,
                //emailFocusNode: _emailFocusNode,
                //onChanged: ,
                //onEditingComplete: ,
                ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const TextFieldPassword(),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            TextFieldSearchBar(
              textController: TextEditingController(),
              hintText: 'Search your focus...',
              childPrefixIcon: CustomAvatar(
                width: size.width / 22.5,
                height: size.width / 22.5,
                assetName: AssetPath.iconSearch,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Terms(size: size),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAvatar(
                  height: size.width / 1.3,
                  width: size.width / 2,
                  assetName: AssetPath.imgAvatar,
                ),
                const Padding(padding: EdgeInsets.only(left: 10)),
                const InputCode(),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Discount(),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Mentor(
                  assetName: AssetPath.imgMentor,
                  title: 'Teaching Fashion',
                  name: 'Bianca Lovata',
                  onTap: () {},
                ),
                //Class Preview
                const ClassPreview(
                  title: 'Entertainment',
                  assetName: AssetPath.imgPreview2,
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: SizedBox(
                height: 192,
                child: ListView.builder(
                  itemCount: mentor.length,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Mentor(
                            assetName: mentor[index].imageUrl,
                            name: mentor[index].name,
                            title: mentor[index].title,
                            onTap: () {},
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Mentor(
                              assetName: mentor[index].imageUrl,
                              name: mentor[index].name,
                              title: mentor[index].title,
                              onTap: () {},
                            ),
                          );
                  },
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsActivity(
                onTap: () {},
                assetName: AssetPath.imgContent,
                title: 'James Haritz',
                name: 'Teaches Social Psychology',
                percent: 0.53,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsCategoryOffice(
                assetName: AssetPath.imgContent4,
                title: 'Alexander Felycia',
                name: 'Teaches Social Psychology',
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: CategoryOffice(
                assetIcon: AssetPath.iconBell,
                title: 'Business',
                countMentor: '12 Mentors',
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemLanguage(
                assetName: AssetPath.iconUS,
                nameLang: 'United States',
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsSubjectsGet(
                title: '11 Hours of Demand Video',
                assetName: AssetPath.iconTime,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsCourse(
                title: 'Introduction Mentor\nand Course 👋🏻',
                assetName: AssetPath.imgCourseList,
                part: 'Course Part 11',
                time: '10:09',
                onTap: () {},
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClassicButton(
                    onTap: () {},
                    width: 132,
                    radius: 10,
                    widthRadius: 0.0,
                    colorRadius: DarkTheme.yellow.withOpacity(0.1),
                    height: 32,
                    color: DarkTheme.yellow.withOpacity(0.1),
                    child: const Center(
                        child: Text(
                      'COURSE PART 1',
                      style: TxtStyle.textCourse,
                    )),
                  ),
                  const SizedBox(
                    height: 65,
                    child: ItemsSubjects(
                      title: 'Social Psychologyy',
                      assetName: AssetPath.imgContentCourse,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsDownloadVideo(
                assetName: AssetPath.imgContentDownload,
                part: 'Course Part 1',
                title: 'Introduction Mentor and\nCourse',
                name: 'Beatrix Annabel',
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsArrowSetting(
                onTap: () {},
                title: 'Change Phone Number',
                assetName: AssetPath.iconUser,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsToggleSetting(
                title: 'Notification',
                assetName: AssetPath.iconBell,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsMyFavorite(
                onTap: () {},
                assetName: AssetPath.imgContent3,
                title: 'Alexander Jane',
                name: 'Teaches Social Psychology',
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SettingAccount(
                onTap: () {
                  //print('aaa');
                },
                fullName: 'Barly Vallendito',
                userName: 'barlyvallendito',
                assetName: AssetPath.imgAvatar,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: CompletedProgress(),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          ],
        ),
      ),
    );
  }
}
