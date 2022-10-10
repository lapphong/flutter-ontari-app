import 'package:flutter/material.dart';

import '../../themes/app_color.dart';
import '../../themes/text_style.dart';
import 'common_button.dart';

class Subscription extends StatelessWidget {
  const Subscription({
    Key? key,
    this.title,
    this.assetName,
    this.device,
    this.money,
    this.textButton,
    this.colorButton,
    this.color,
    this.onTap,
  }) : super(key: key);

  final String? title, assetName, device, money, textButton;
  final Color? color, colorButton;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 184,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title!,
                    style: TxtStyle.headline4White2,
                  ),
                  SizedBox(
                      width: 32,
                      height: 32,
                      child: CircleButton(
                        assetPath: assetName,
                        bgColor: DarkTheme.white.withOpacity(0.2),
                      )),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                device!,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: DarkTheme.white.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  text: money!,
                  style: TxtStyle.headline1BoldWhite,
                  children: const <TextSpan>[
                    TextSpan(
                      text: ' /Month',
                      style: TxtStyle.headline5MediumWhite2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ClassicButton(
                onTap: onTap,
                radius: 10,
                height: 40,
                color: colorButton,
                child: Center(
                  child: Text(
                    textButton!,
                    style: TxtStyle.currentPlan,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
