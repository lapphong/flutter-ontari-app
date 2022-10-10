import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/details/pages/detail_playing_course.dart';
import 'package:ontari_app/modules/details/widgets/items_course.dart';
import 'package:ontari_app/modules/details/widgets/items_subjects.dart';
import 'package:ontari_app/modules/details/widgets/items_subjects_get.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';

import '../../../assets/assets_path.dart';

class DetailMentorPage extends StatefulWidget {
  const DetailMentorPage({Key? key}) : super(key: key);

  @override
  State<DetailMentorPage> createState() => _DetailMentorPageState();
}

class _DetailMentorPageState extends State<DetailMentorPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollViewController;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Overview'),
    const Tab(text: 'Course'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: myTabs.length, vsync: this);
    _tabController.addListener(() => setState(() {}));
    _scrollViewController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                AssetPath.imgDetailMentor,
                fit: BoxFit.cover,
                height: 404,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 702,
                    child: NestedScrollView(
                      controller: _scrollViewController,
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return [
                          const SliverPersistentHeader(
                            pinned: true,
                            delegate: ImageHeader(
                              maxExtent: 404,
                              minExtent: 170,
                            ),
                          ),
                          SliverOverlapAbsorber(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                            sliver: SliverPersistentHeader(
                              pinned: true,
                              floating: false,
                              delegate: SliverPersistentHeaderDelegateImpl(
                                tabBar: TabBar(
                                  tabs: myTabs,
                                  controller: _tabController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  labelStyle: TxtStyle.headline4blue,
                                  unselectedLabelColor: DarkTheme.greyScale500,
                                  unselectedLabelStyle:
                                      TxtStyle.headline4GreyTab,
                                  labelColor: DarkTheme.primaryBlue600,
                                  indicatorColor: DarkTheme.primaryBlue600,
                                ),
                              ),
                            ),
                          ),
                        ];
                      },
                      body: Container(
                        color: DarkTheme.greyScale900,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Builder(
                              builder: (BuildContext context) {
                                return CustomScrollView(
                                  key: PageStorageKey(myTabs[0]),
                                  slivers: <Widget>[
                                    SliverOverlapInjector(
                                      handle: NestedScrollView
                                          .sliverOverlapAbsorberHandleFor(
                                              context),
                                    ),
                                    SliverToBoxAdapter(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 24.0, bottom: 14),
                                                  child: Text('Discover',
                                                      style: TxtStyle
                                                          .headline3SemiBoldWhite),
                                                ),
                                                Text(
                                                  'What are people most afraid of? What do our\ndreams mean? Are we natural-born racists? What\nmakes us happy? What are the causes and cures\nof mental illness? This course tries to answer\nthese questions and many others, providing a\ncomprehensive overview of the scientific study.',
                                                  style: TxtStyle
                                                      .headline5MediumWhite,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 24.0, bottom: 14),
                                                  child: Text(
                                                    'What you\'ll learn',
                                                    style: TxtStyle
                                                        .headline3SemiBoldWhite,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 24),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                buildListView(subjects),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 24.0, bottom: 14),
                                                  child: Text(
                                                    'What you\'ll get',
                                                    style: TxtStyle
                                                        .headline3SemiBoldWhite,
                                                  ),
                                                ),
                                                buildListViewGet(subjectsGet),
                                                Stack(
                                                  children: [
                                                    SizedBox(
                                                      height: 98,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: const [
                                                          Text(
                                                            'Requirements',
                                                            style: TxtStyle
                                                                .headline3SemiBoldWhite,
                                                          ),
                                                          Text(
                                                            'Understanding of The English Language',
                                                            style: TxtStyle
                                                                .headline4SemiBoldWhite,
                                                          ),
                                                          Text(''),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 88,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            DarkTheme.gradient1,
                                                            DarkTheme.gradient2
                                                          ],
                                                          begin: Alignment
                                                              .bottomCenter,
                                                          end: Alignment
                                                              .topCenter,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            Builder(
                              builder: (BuildContext context) {
                                return CustomScrollView(
                                  key: PageStorageKey(myTabs[1]),
                                  slivers: <Widget>[
                                    SliverOverlapInjector(
                                      handle: NestedScrollView
                                          .sliverOverlapAbsorberHandleFor(
                                              context),
                                    ),
                                    SliverToBoxAdapter(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24.0),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                buildListCourse(
                                                    courseItem, context),
                                              ],
                                            ),
                                            const SizedBox(height: 100),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildListView(List<ModelSubjects> list) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ItemsSubjects(
              assetName: list[index].iconUrl,
              title: list[index].title,
            ),
          );
        },
      ),
    );
  }

  ListView buildListViewGet(List<ModelSubjects> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: ItemsSubjectsGet(
            assetName: list[index].iconUrl,
            title: list[index].title,
          ),
        );
      },
    );
  }

  ListView buildListCourse(List<ModelCourse> list, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ItemsCourse(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayingCoursePage(index: index),
                ),
              );
            },
            assetName: item.iconUrl,
            time: item.time,
            part: item.part,
            title: item.title,
          ),
        );
      },
    );
  }
}

class SliverPersistentHeaderDelegateImpl
    extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  const SliverPersistentHeaderDelegateImpl({
    required this.tabBar,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: DarkTheme.greyScale900,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class ImageHeader extends SliverPersistentHeaderDelegate {
  const ImageHeader({Key? key, this.minExtent = 0, required this.maxExtent});

  @override
  final double minExtent;
  @override
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Image.asset(
          AssetPath.imgDetailMentor,
          fit: BoxFit.cover,
          height: 404,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: DarkTheme.greyScale100,
                        ),
                      ),
                      child: const Image(
                        image: AssetImage(AssetPath.iconArrowLeft),
                        color: DarkTheme.white,
                      ),
                    ),
                  ),
                  const Image(
                    width: 30,
                    height: 30,
                    image: AssetImage(AssetPath.iconMyFavorite),
                    fit: BoxFit.cover,
                    color: DarkTheme.greyScale400,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'CRISTOPHER HARITZ',
                        style: TxtStyle.headline3SemiBoldWhite,
                      ),
                      Text(
                        'Teaches Psychology',
                        style: TxtStyle.headline4SemiBoldWhite,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 52,
                    height: 52,
                    child: CircleButton(
                      widthIcon: 24,
                      heightIcon: 24,
                      bgColor: DarkTheme.primaryBlue600,
                      assetPath: AssetPath.iconPlay,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
