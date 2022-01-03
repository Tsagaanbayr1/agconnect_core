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

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:agconnect_core/agconnect_core.dart';

void main() {
  const MethodChannel channel = MethodChannel('com.huawei.flutter/agconnect_core');

  TestWidgetsFlutterBinding.ensureInitialized();
  MethodCall? mockCall;
  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      mockCall = methodCall;
      switch (methodCall.method) {
        case'setApiKey':
          return null;
        case'setClientId':
          return null;
        case'setClientSecret':
          return null;
      }
      throw PlatformException(code: '0', message: 'Unknown method call, please update test.');
    });
    mockCall = null;
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('setApiKey', () async {
    await AGCApp.instance.setApiKey('test_api_key');
    expect(mockCall!.method, 'setApiKey');
    expect(mockCall!.arguments, {'apiKey':'test_api_key'});
  });

  test('setClientId', () async {
    await AGCApp.instance.setClientId('test_client_id');
    expect(mockCall!.method, 'setClientId');
    expect(mockCall!.arguments, {'clientId':'test_client_id'});
  });

  test('setClientSecret', () async {
    await AGCApp.instance.setClientSecret('test_client_secret');
    expect(mockCall!.method, 'setClientSecret');
    expect(mockCall!.arguments, {'clientSecret':'test_client_secret'});
  });

}
