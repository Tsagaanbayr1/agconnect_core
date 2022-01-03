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

package com.huawei.agconnectcore;

import android.content.Context;

import androidx.annotation.NonNull;

import com.huawei.agconnect.AGConnectApp;
import com.huawei.agconnect.AGConnectInstance;

import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class AGConnectCorePlugin implements FlutterPlugin, MethodCallHandler {
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        initAGConnectSDK(flutterPluginBinding.getApplicationContext());
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "com.huawei.flutter/agconnect_core");
        channel.setMethodCallHandler(this);
    }

    public static void registerWith(Registrar registrar) {
        initAGConnectSDK(registrar.context().getApplicationContext());
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "com.huawei.flutter/agconnect_core");
        channel.setMethodCallHandler(new AGConnectCorePlugin());
    }

    static void initAGConnectSDK(Context context) {
        if (AGConnectInstance.getInstance() == null) {
            AGConnectInstance.initialize(context);
        }
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("setApiKey")) {
            Map<String, Object> arguments = call.arguments();
            String apiKey = (String) arguments.get("apiKey");
            AGConnectApp.getInstance().setApiKey(apiKey);
            result.success(null);

        } else if (call.method.equals("setClientId")) {
            Map<String, Object> arguments = call.arguments();
            String clientId = (String) arguments.get("clientId");
            AGConnectApp.getInstance().setClientId(clientId);
            result.success(null);

        } else if (call.method.equals("setClientSecret")) {
            Map<String, Object> arguments = call.arguments();
            String clientSecret = (String) arguments.get("clientSecret");
            AGConnectApp.getInstance().setClientSecret(clientSecret);
            result.success(null);
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}
