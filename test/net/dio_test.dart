
import 'package:dio/dio.dart';
import 'package:flu-read/net/net.dart';
import 'package:flu-read/shop/models/user_entity.dart';
import 'package:test/test.dart';

void main() {
  group('dio_test', () {
    Dio dio;
    setUp(() {
      /// 测试配置
      dio = DioUtils.instance.getDio();
      dio.options.baseUrl = 'https://api.github.com/';
    });
    
    test('getUsers', () async {
      await DioUtils.instance.requestNetwork<UserEntity>(
        Method.get, HttpApi.users, 
        onSuccess: (data) {
          expect(data.name, '唯鹿');
        },
        onError: (_, __) {
          print('$_, $__');
        }
      );
    });
  });
}