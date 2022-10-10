import 'package:flutter/material.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/activity/widgets/activity_empty.dart';
import 'package:ontari_app/modules/activity/widgets/completed_progress.dart';
import 'package:ontari_app/modules/activity/widgets/items_activity.dart';
import 'package:ontari_app/modules/activity/widgets/uncompleted_progress.dart';
import 'package:ontari_app/modules/details/pages/detail_mentor_page.dart';

import '../../../assets/assets_path.dart';
import '../../../themes/app_color.dart';
import '../../../widgets/stateless/common_button.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Incomplete'),
    const Tab(text: 'Complete'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _isSelectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    buildTitleActivity(),
                    activityIncomplete.isNotEmpty
                        ? (_isSelectedTab == 0
                            ? buildProgressUncompleted()
                            : buildProgressCompleted())
                        : const Text(''),
                  ],
                ),
              ),
              Material(
                color: activityIncomplete.isNotEmpty
                    ? DarkTheme.primaryBlueButton
                    : DarkTheme.greyScale900,
                child: TabBar(
                  onTap: (value) {
                    setState(() {
                      _isSelectedTab = value;
                    });
                  },
                  tabs: myTabs,
                  labelColor: DarkTheme.primaryBlue600,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TxtStyle.headline4blue,
                  unselectedLabelColor: DarkTheme.greyScale500,
                  physics: const NeverScrollableScrollPhysics(),
                  unselectedLabelStyle: TxtStyle.headline4GreyTab,
                  indicatorColor: DarkTheme.primaryBlue600,
                ),
              ),
              Container(
                color: activityIncomplete.isNotEmpty
                    ? DarkTheme.primaryBlueButton
                    : DarkTheme.greyScale900,
                height: _isSelectedTab == 0 ? 400 : 550,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    activityIncomplete.isNotEmpty
                        ? buildListView(activityIncomplete)
                        : const ActivityEmpty(),
                    activityComplete.isNotEmpty
                        ? buildListView(activityComplete)
                        : const ActivityEmpty(),
                  ],
                ),
              ),
            ],
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
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 0),
          child: ItemsActivity(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailMentorPage(),
                ),
              );
            },
            assetName: list[index].imageUrl,
            title: list[index].title,
            name: list[index].name,
            percent: list[index].percentProgress,
          ),
        );
      },
    );
  }

  Padding buildProgressCompleted() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: CompletedProgress(),
    );
  }

  Padding buildProgressUncompleted() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: UncompletedProgress(
        percent: 0.8,
        percentCompleted: 16,
        percentUnCompleted: 4,
      ),
    );
  }

  SizedBox buildTitleActivity() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Activity', style: TxtStyle.titlePage),
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
