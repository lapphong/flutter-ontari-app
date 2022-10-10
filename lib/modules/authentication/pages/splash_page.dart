import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/modules/landing_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Expanded(
            flex: 8,
            child: Center(child: Text('Ontari.', style: TxtStyle.titleSplash)),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.0),
              child: Text(
                textAlign: TextAlign.center,
                'Lorem ipsum dolor sit amet, consectetur adipiscing\nelit. Tincidunt et, volutpat duis amet, risus.',
                style: TxtStyle.bodyTextSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
