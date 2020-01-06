

import 'package:flutter/material.dart';
import 'package:flu-read/goods/models/goods_item_entity.dart';
import 'package:flu-read/goods/provider/goods_page_provider.dart';
import 'package:flu-read/routers/fluro_navigator.dart';
import 'package:flu-read/util/toast.dart';
import 'package:flu-read/widgets/my_refresh_list.dart';
import 'package:flu-read/widgets/state_layout.dart';
import 'package:provider/provider.dart';

import '../goods_router.dart';
import 'goods_delete_bottom_sheet.dart';
import 'goods_item.dart';

class GoodsList extends StatefulWidget {
  
  const GoodsList({
    Key key,
    @required this.index
  }): super(key: key);
  
  final int index;
  
  @override
  _GoodsListState createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> with AutomaticKeepAliveClientMixin<GoodsList>, SingleTickerProviderStateMixin {
  
  int _selectIndex = -1;
  Animation<double> _animation;
  AnimationController _controller;
  List<GoodsItemEntity> _list = [];

  @override
  void initState() {
    super.initState();
    // 初始化动画控制
    _controller = new AnimationController(duration: const Duration(milliseconds: 450), vsync: this);
    // 动画曲线
    CurvedAnimation _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOutSine);
    _animation = new Tween(begin: 0.0, end: 1.1).animate(_curvedAnimation);

    //Item数量
    _maxPage = widget.index == 0 ? 1 : (widget.index == 1 ? 2 : 3);

    _onRefresh();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  List<String> _imgList = [
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578920168&di=721da64fc98a1aa6ca7f1eaf90f0078f&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.zjol.com.cn%2Fpic%2F0%2F05%2F60%2F22%2F5602222_446125.jpg',
    '', // 故意使用一张无效链接，触发默认显示图片
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578920168&di=721da64fc98a1aa6ca7f1eaf90f0078f&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.zjol.com.cn%2Fpic%2F0%2F05%2F60%2F22%2F5602222_446125.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578920168&di=721da64fc98a1aa6ca7f1eaf90f0078f&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.zjol.com.cn%2Fpic%2F0%2F05%2F60%2F22%2F5602222_446125.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578920168&di=721da64fc98a1aa6ca7f1eaf90f0078f&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.zjol.com.cn%2Fpic%2F0%2F05%2F60%2F22%2F5602222_446125.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578920168&di=721da64fc98a1aa6ca7f1eaf90f0078f&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.zjol.com.cn%2Fpic%2F0%2F05%2F60%2F22%2F5602222_446125.jpg'
  ];

  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _page = 1;
        _list = List.generate(widget.index == 0 ? 3 : 10, (i) => GoodsItemEntity(icon: _imgList[i % 6], title: '浪潮之巅', type: i % 3));
      });
      _setGoodsCount(_list.length);
    });
  }

  Future _loadMore() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _list.addAll(List.generate(10, (i) => GoodsItemEntity(icon: _imgList[i % 6], title: '浪潮之巅', type: i % 3)));
        _page ++;
      });
      _setGoodsCount(_list.length);
    });
  }
  
  _setGoodsCount(int count) {
    GoodsPageProvider provider = Provider.of<GoodsPageProvider>(context, listen: false);
    provider.setGoodsCount(count);
  }

  int _page = 1;
  int _maxPage;
  StateType _stateType = StateType.loading;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DeerListView(
      itemCount: _list.length,
      stateType: _stateType,
      onRefresh: _onRefresh,
      loadMore: _loadMore,
      hasMore: _page < _maxPage,
      itemBuilder: (_, index) {
        return GoodsItem(
          index: index,
          selectIndex: _selectIndex,
          item: _list[index],
          animation: _animation,
          onTapMenu: () {
            // 开始执行动画
            _controller.forward(from: 0.0);
            setState(() {
              _selectIndex = index;
            });
          },
          onTapMenuClose: () {
            _controller.reverse(from: 1.1);
            _selectIndex = -1;
          },
          onTapEdit: () {
            setState(() {
              _selectIndex = -1;
            });
            NavigatorUtils.push(context, '${GoodsRouter.goodsEditPage}?isAdd=false');
          },
          onTapOperation: () {
            Toast.show('下架');
          },
          onTapDelete: () {
            _controller.reverse(from: 1.1);
            _selectIndex = -1;
            _showDeleteBottomSheet(index);
          },
        );
      }
    );
  }

  @override
  bool get wantKeepAlive => true;

  _showDeleteBottomSheet(int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GoodsDeleteBottomSheet(
          onTapDelete: () {
            setState(() {
              _list.removeAt(index);
              if (_list.isEmpty) {
                _stateType = StateType.goods;
              }
            });
            _setGoodsCount(_list.length);
          },
        );
      },
    );
  }
}
