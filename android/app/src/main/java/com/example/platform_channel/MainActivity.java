package com.example.platform_channel;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "app.alego.com/pltChannel";

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
      .setMethodCallHandler(
          (call, result) -> {
            if(call.method.equals("helloWorld")){
              String textHw = helloWorld();
              result.success(textHw);
            }else{
              result.error("UNAVAILABLE", "NO TEXT", null);
            }
          }
      );

  }

  private String helloWorld(){
    String teks = "Hello World";
    return teks;
  }
}
