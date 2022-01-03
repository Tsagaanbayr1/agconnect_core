/*
 * Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import 'dart:io';

import 'package:flutter/services.dart';

class AGCApp {
  static const MethodChannel _channel =
      const MethodChannel('com.huawei.flutter/agconnect_core');

  /// 获取AGCApp实例
  static final AGCApp instance = AGCApp();

  Future<void> setApiKey(String apiKey) {
    assert(apiKey != null);
    if(Platform.isIOS) {
      print('The setApiKey method only supports Android, please refer to the iOS development guide to set client secret on iOS.');
    }
    return _channel
        .invokeMethod('setApiKey', <String, dynamic>{'apiKey': apiKey});
  }

  Future<void> setClientId(String clientId) {
    assert(clientId != null);
    if(Platform.isIOS) {
      print('The setClientId method only supports Android, please refer to the iOS development guide to set client secret on iOS.');
    }
    return _channel
        .invokeMethod('setClientId', <String, dynamic>{'clientId': clientId});
  }

  Future<void> setClientSecret(String clientSecret) {
    assert(clientSecret != null);
    if(Platform.isIOS) {
      print('The setClientSecret method only supports Android, please refer to the iOS development guide to set client secret on iOS.');
    }
    return _channel.invokeMethod(
        'setClientSecret', <String, dynamic>{'clientSecret': clientSecret});
  }
}
