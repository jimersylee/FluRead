

import 'package:flutter/material.dart';
import 'package:flu-read/util/toast.dart';
import 'package:flu-read/widgets/search_bar.dart';

class GoodsSearchPage extends StatefulWidget {
  @override
  _GoodsSearchPageState createState() => _GoodsSearchPageState();
}

class _GoodsSearchPageState extends State<GoodsSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        hintText: '请输入书籍名称查询',
        onPressed: (text) {
          Toast.show('搜索内容：$text');
        },
      ),
      body: Container(
      ),
    );
  }
}
