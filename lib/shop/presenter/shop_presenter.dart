
import 'package:flutter/material.dart';
import 'package:flu-read/mvp/base_page_presenter.dart';
import 'package:flu-read/net/net.dart';
import 'package:flu-read/shop/models/user_entity.dart';
import 'package:flu-read/shop/page/shop_page.dart';


class ShopPagePresenter extends BasePagePresenter<ShopPageState> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 接口请求例子
      /// get请求参数queryParameters  post请求参数params
      asyncRequestNetwork<UserEntity>(Method.get,
        url: HttpApi.users,
        onSuccess: (data) {
          view.setUser(data);
          // 或
          // view.provider.setUser(data);
        },
      );
    });
  }
 
}