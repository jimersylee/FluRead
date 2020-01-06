import 'package:flutter/material.dart';
import 'package:flu-read/res/resources.dart';
import 'package:flu-read/util/theme_utils.dart';
import 'package:flu-read/widgets/app_bar.dart';
import 'package:sticky_headers/sticky_headers.dart';

/// design/6店铺-账户/index.html#artboard1
class AccountRecordListPage extends StatefulWidget {
  @override
  _AccountRecordListPageState createState() => _AccountRecordListPageState();
}

class _AccountRecordListPageState extends State<AccountRecordListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: '阅读记录',
      ),
      body: ListView.builder(
        itemCount: 8,

        /// 将item默认合并的语义拆开，自行组合， 另一种方式见 withdrawal_record_list_page.dart
        addSemanticIndexes: false,
        itemBuilder: (_, index) {
          return StickyHeader(
            header: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              color: ThemeUtils.getStickyHeaderColor(context),
              padding: const EdgeInsets.only(left: 16.0),
              height: 34.0,
              child: Text('2018/06/0${index + 1}'),
            ),
            content: _buildItem(index),
          );
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    List<Widget> list = List.generate(index + 1, (i) {
      return Container(
        height: 72.0,
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            border: Border(
          bottom: Divider.createBorderSide(context, width: 0.8),
        )),
        child: IndexedSemantics(
          index: index,
          child: Stack(
            children: <Widget>[
              Text(i % 2 == 0 ? '阅读浪潮之巅' : '阅读数学之美'),
              Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Text(i % 2 == 0 ? '+10' : '11',
                      style: TextStyle(
                          color: Theme.of(context).errorColor,
                          fontWeight: FontWeight.bold))),
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  child: Text(i % 2 == 0 ? '18:20:10' : '18:20:11',
                      style: Theme.of(context).textTheme.subtitle)),
              Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Text('总页数：30000',
                      style: Theme.of(context).textTheme.subtitle)),
            ],
          ),
        ),
      );
    });
    return Column(children: list);
  }
}
