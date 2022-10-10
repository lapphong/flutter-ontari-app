import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:ontari_app/widgets/stateless/indicator_home.dart';

import '../../../assets/assets_path.dart';
import '../../../widgets/stateless/subscription.dart';

class SelectPlanPage extends StatelessWidget {
  const SelectPlanPage({Key? key}) : super(key: key);

  openSendLink(context) {
    return showModalBottomSheet(
      elevation: 0,
      barrierColor: Colors.black.withAlpha(1),
      context: context,
      builder: (context) {
        return Container(
          height: 186,
          color: DarkTheme.primaryBlueButton,
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text('Uses Individual Plan', style: TxtStyle.headline4blue),
              const SizedBox(height: 8),
              const Text('Plan automatically renews monthly until cancelled.',
                  style: TxtStyle.headline6MediumGrey),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: ClassicButton(
                  height: 52,
                  color: DarkTheme.primaryBlue600,
                  radius: 12,
                  colorRadius: DarkTheme.primaryBlue600,
                  child: const Center(
                    child: Text('Send Link', style: TxtStyle.currentPlan),
                  ),
                  onTap: () {
                    //print('aaa');
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(120, 21, 120, 17),
                child: IndicatorHome(
                  color: DarkTheme.white,
                  radius: 10,
                  height: 5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 140, 152, 8),
              child: Text('Subscription', style: TxtStyle.headline2BoldWhite),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 120, 44),
              child: Text('Please Select your plan that\'s\nright for you',
                  style: TxtStyle.bodySmallMediumGrey),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Subscription(
                        color: DarkTheme.primaryBlue600,
                        title: 'Individual',
                        device: '1 device',
                        money: '\$42',
                        textButton: 'Current Plan',
                        colorButton: DarkTheme.greyScale900,
                        assetName: AssetPath.iconStar,
                        onTap: () => openSendLink(context),
                      ),
                      Subscription(
                        color: DarkTheme.greyScale700,
                        colorButton: DarkTheme.primaryBlue600,
                        title: 'Family',
                        device: '5 device',
                        money: '\$75',
                        textButton: 'Upgrade',
                        assetName: AssetPath.iconFamily,
                        onTap: () {
                          //print('bbb');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  IndicatorHome(
                    height: 1,
                    color: DarkTheme.greyScale600.withOpacity(0.5),
                    radius: 10,
                  ),
                  const SizedBox(height: 24),
                  RichText(
                    text: const TextSpan(
                      text:
                          'By continuing the purchase, you acknowledge that you\nhave read our ',
                      style: TxtStyle.bodyTextSmall,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms & Condition',
                          style: TxtStyle.create
                        ),
                        TextSpan(
                          text: 'and that you agree to our ',
                          style: TxtStyle.bodyTextSmall,
                        ),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TxtStyle.create
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

