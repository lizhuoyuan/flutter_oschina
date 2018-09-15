/*
 * Created by 李卓原 on 2018/9/15.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:dio/dio.dart';

class HttpUtil {
  Dio dio;

  HttpUtil() {
    if (dio == null) {
      print('dio赋值');
      dio = new Dio();
    }
  }

  get(url) async {
    print('网络请求启动!url：$url');
    Response response;
    try {
      response = await dio.get(url);
      print('网络请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      print('网络请求发生错误：$e');
    }
    return response.data;
  }
}
