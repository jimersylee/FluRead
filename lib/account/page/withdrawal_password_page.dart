
import 'package:flutter/material.dart';
import 'package:flu-read/account/widgets/sms_verify_dialog.dart';
import 'package:flu-read/account/widgets/withdrawal_password_setting_dialog.dart';
import 'package:flu-read/res/resources.dart';
import 'package:flu-read/routers/fluro_navigator.dart';
import 'package:flu-read/util/utils.dart';
import 'package:flu-read/widgets/app_bar.dart';
import 'package:flu-read/widgets/base_dialog.dart';
import 'package:flu-read/widgets/click_item.dart';

/// design/6店铺-账户/index.html#artboard20
class WithdrawalPasswordPage extends StatefulWidget {
  @override
  _WithdrawalPasswordPageState createState() => _WithdrawalPasswordPageState();
}

class _WithdrawalPasswordPageState extends State<WithdrawalPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: '提现密码',
      ),
      body: Column(
        children: <Widget>[
          Gaps.vGap5,
          ClickItem(
            title: '修改密码',
            onTap: () {
              showModalBottomSheet(
                context: context,
                /// 使用true则高度不受16分之9的最高限制
                isScrollControlled: true,
                builder: (_) => WithdrawalPasswordSettingDialog()
              );
            }
          ),
          ClickItem(
            title: '忘记密码',
            onTap: () {
              showElasticDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return BaseDialog(
                    hiddenTitle: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: const Text('为了您的账户安全需先进行短信验证并设置提现密码。', textAlign: TextAlign.center),
                    ),
                    onPressed: () {
                      NavigatorUtils.goBack(context);
                      _showVerifyDialog();
                    },
                  );
                }
              );
            }
          ),
        ],
      ),
    );
  }
  
  _showVerifyDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => SMSVerifyDialog()
    );
  }
}
