package com.example.android_raw_read;

import android.app.Activity;
import android.content.Context;
import android.media.Ringtone;
import android.media.RingtoneManager;
import android.net.Uri;
import android.util.Log;

import androidx.annotation.NonNull;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** AndroidRawReadPlugin */
public class AndroidRawReadPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context applicationContext;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "android_raw_read");
    channel.setMethodCallHandler(this);
    applicationContext = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } if (call.method.equals("readRawFile")) {
      if(applicationContext == null){
        result.success(false);
        return;
      }
      String fileName = (String) call.arguments;
      if(fileName.length() > 0)
      {
        try {

          if(fileName.contains(".")){
            fileName = fileName.split("\\.")[0];
          }
          Log.e("rawFileTest","fileName:" + fileName);
//            fileName = "test";
          int resourceId = applicationContext.getResources().getIdentifier(fileName,"raw",applicationContext.getPackageName());
          Log.e("rawFileTest","resourceId:" + resourceId);
          InputStream im = applicationContext.getResources().openRawResource(resourceId);
          BufferedReader read = new BufferedReader(new InputStreamReader(im));
          StringBuffer out =   new StringBuffer();
          String line;
          while((line = read.readLine()) != null) {
            out.append(line).append("\n");
          }
          Log.e("rawFileTest","data:" + out);
          result.success(true);

        }
        catch (Exception e)
        {
          e.printStackTrace();
          result.success(false);
        }

      }
      else
      {
        result.success(false);
      }
    }
    else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
    applicationContext = null;
  }
}
