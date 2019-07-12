package com.example.flutter_plugin_helloworld;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import com.example.mylibrary.Utils;

/** FlutterPluginHelloworldPlugin */
public class FlutterPluginHelloworldPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_plugin_helloworld");
    channel.setMethodCallHandler(new FlutterPluginHelloworldPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("getHelloWorld")) {
      System.out.println("=========Call HelloWorld");
      // Utils에는 getHelloWorld() 하나밖에 없습니다.
      result.success("UTILS => " + Utils.getHelloWorld());
    } else {
      result.notImplemented();
    }
  }
}
