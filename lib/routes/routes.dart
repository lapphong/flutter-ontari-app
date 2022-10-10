import 'package:flutter/material.dart';
import 'package:ontari_app/modules/authentication/pages/select_plan_page.dart';
import 'package:ontari_app/modules/authentication/pages/splash_page.dart';
import 'package:ontari_app/modules/common/common_widget_page.dart';
import 'package:ontari_app/modules/details/pages/detail_mentor_page.dart';
import 'package:ontari_app/modules/details/pages/detail_playing_course.dart';
import 'package:ontari_app/modules/root/widgets/tab_item.dart';
import 'package:ontari_app/modules/setting/pages/change_language_page.dart';
import 'package:ontari_app/modules/setting/pages/download_video_page.dart';
import 'package:ontari_app/modules/setting/pages/edit_profile_page.dart';
import 'package:ontari_app/modules/setting/pages/my_favorite_page.dart';
import 'package:ontari_app/providers/bloc_provider.dart';
import 'package:ontari_app/routes/route_name.dart';

import '../models/user.dart';
import '../modules/root/pages/root_page.dart';
import '../../widgets/stateful/pages.dart';
import '../modules/authentication/pages/sign_in_page.dart';
import '../modules/authentication/pages/sign_up_page.dart';
import '../modules/authentication/pages/verify_your_page.dart';
import '../modules/setting/bloc/setting_bloc.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.commonWidgetPage:
        return _buildRoute(settings, const CommonWidgetPage());
      case RouteName.listPage:
        return _buildRoute(settings, const ListPage());
      case RouteName.splash:
        return _buildRoute(settings, const SplashPage());
      case RouteName.signInPage:
        return _buildRoute(settings, const SignInPage());
      case RouteName.signUpPage:
        return _buildRoute(settings, const SignUpPage());
      case RouteName.verifyYourPage:
        return _buildRoute(settings, const VerifyYourPage());
      case RouteName.selectPlanPage:
        return _buildRoute(settings, const SelectPlanPage());
      case RouteName.homePage:
        return _buildRoute(settings, const RootPage());
      case RouteName.activityPage:
        return _buildRoute(
            settings, const RootPage(currentTab: TabItem.activity));
      case RouteName.categoryPage:
        return _buildRoute(
            settings, const RootPage(currentTab: TabItem.category));
      case RouteName.settingPage:
        return _buildRoute(
            settings, const RootPage(currentTab: TabItem.setting));
      case RouteName.languagePage:
        return _buildRoute(settings, const LanguagePage());
      case RouteName.favoritePage:
        return _buildRoute(settings, const MyFavoritePage());
      case RouteName.downloadVideoPage:
        return _buildRoute(settings, DownloadVideoPage());
      case RouteName.editProfilePage:
        return _buildRoute(settings, EditProfilePage());
      case RouteName.detailMentorPage:
        return _buildRoute(settings, const DetailMentorPage());
      case RouteName.playingCoursePage:
        return _buildRoute(settings, const PlayingCoursePage());
      case RouteName.fullScreenPage:
        return _buildRoute(settings, const SplashPage());
      default:
        return _errorRoute(settings);
    }
  }

  static Route authorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildRoute(
          settings,
          BlocProvider(
            bloc: SettingBloc()..getUserDeTail(),
            child: const RootPage(),
          ),
        );
      case RouteName.editProfilePage:
        final user = settings.arguments;
        if (user is User) {
          return _buildRoute(settings, EditProfilePage(user: user));
        }
        return _errorRoute(settings);
      //----------------------------------------------------------------------
      // case RouteName.createPostPage:
      //   return _buildRouteDialog(
      //     settings,
      //     const CreatePostPage(),
      //   );
      // case RouteName.postDetailPage:
      //   final post = settings.arguments;
      //   if (post is Post) {
      //     return _buildRoute(
      //       settings,
      //       BlocProvider(
      //         bloc: PostDetailBloc(post.id!),
      //         child: BlocProvider(
      //           bloc: CommentBloc(post.id!),
      //           child: PostDetailPage(post: post),
      //         ),
      //       ),
      //     );
      //   }
      //return _errorRoute(settings);
      //----------------------------------------------------------------------
      default:
        return _errorRoute(settings);
    }
  }

  static Route unAuthorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildRoute(
          settings,
          const SignInPage(),
        );
      default:
        return _errorRoute(settings);
    }
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  static Route _errorRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    );
  }
}
