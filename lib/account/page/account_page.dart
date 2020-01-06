
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flu-read/account/widgets/rise_number_text.dart';
import 'package:flu-read/res/resources.dart';
import 'package:flu-read/routers/fluro_navigator.dart';
import 'package:flu-read/util/image_utils.dart';
import 'package:flu-read/widgets/app_bar.dart';
import 'package:flu-read/widgets/click_item.dart';

import '../account_router.dart';

/// design/6店铺-账户/index.html#artboard2
class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: '精神食粮',
      ),
      body: Column(
        children: <Widget>[
          Gaps.vGap5,
          AspectRatio(
            aspectRatio: 1.85,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ImageUtils.getAssetImage('account/bg'),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                Positioned.fill(
                  top: 37.0,
                  child: MergeSemantics(
                    child: Column(
                      children: <Widget>[
                        const Text('输出笔记(篇)', style: TextStyle(color: Colours.text_disabled, fontSize: Dimens.font_sp12)),
                        Gaps.vGap8,
                        RiseNumberText(30, style: TextStyle(color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin')),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 37.0,
                  left: 70.0,
                  right: 70.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MergeSemantics(
                        child: Column(
                          children: <Widget>[
                            const Text('累计阅读页数', style: TextStyle(color: Colours.text_disabled, fontSize: Dimens.font_sp12)),
                            Gaps.vGap8,
                            RiseNumberText(NumUtil.getDoubleByValueStr('20000'), style: TextStyle(color: Colours.text_disabled, fontSize: Dimens.font_sp14, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin')),
                          ],
                        ),
                      ),
                      MergeSemantics(
                        child: Column(
                          children: <Widget>[
                            const Text('累计阅读本数', style: TextStyle(color: Colours.text_disabled, fontSize: Dimens.font_sp12)),
                            Gaps.vGap8,
                            RiseNumberText(11, style: TextStyle(color: Colours.text_disabled, fontSize: Dimens.font_sp14, fontWeight: FontWeight.bold, fontFamily: 'RobotoThin')),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Gaps.vGap5,
          ClickItem(
            title: '记一笔',
            onTap: () => NavigatorUtils.push(context, AccountRouter.withdrawalPage),
          ),
          ClickItem(
            title: '写一篇',
            onTap: () => NavigatorUtils.push(context, AccountRouter.withdrawalRecordListPage),
          ),
          ClickItem(
            title: '冥想',
            onTap: () => NavigatorUtils.push(context, AccountRouter.withdrawalPasswordPage),
          ),
        ],
      )
    );
  }
}
