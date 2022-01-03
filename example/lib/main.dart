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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:agconnect_core/agconnect_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _setApiKey() async {
    await AGCApp.instance.setApiKey('my_api_key');
  }

  _setClientId() async {
    await AGCApp.instance.setClientId('my_client_id');
  }

  _setClientSecret() async {
    await AGCApp.instance.setClientSecret('my_client_secret');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ListView(children: <Widget>[
            CupertinoButton(child: Text('setApiKey'), onPressed: _setApiKey),
            CupertinoButton(child: Text('setClientId'), onPressed: _setClientId),
            CupertinoButton(child: Text('setClientSecret'), onPressed: _setClientSecret),
          ]),
        ),
      ),
    );
  }
}
