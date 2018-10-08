/*
 * Created by 李卓原 on 2018/10/8.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  bool _nightMode = false;

  get nightMode => _nightMode;

  void setNight(bool isNight) {
    _nightMode = isNight;
    notifyListeners();
  }
}
