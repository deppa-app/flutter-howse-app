package cl.toc.plugin_toc;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;
import android.util.Log;
import android.widget.ImageView;

import androidx.annotation.NonNull;

import java.util.ArrayList;

import cl.toc.labs.autocapture.CaptureActivity;
import cl.toc.labs.tcam.LivenessIntro;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import static android.app.Activity.RESULT_CANCELED;
import static android.app.Activity.RESULT_OK;

/**
 * PluginTocPlugin
 */
public class PluginTocPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {

  /// The MethodChannel that will the communication between Flutter and native Android
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private static final String channelName = "plugin_toc";

  private static int IDCodeLive = 9101;
  private static int IDCodeFront = 9102;
  private static int IDCodeBack = 9103;

  private static Activity activity;
  private Result pendingResult;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), channelName);
    channel.setMethodCallHandler(this);
  }

  public static void registerWith(Registrar registrar) {
    activity = registrar.activity();
    final MethodChannel channel = new MethodChannel(registrar.messenger(), channelName);
    channel.setMethodCallHandler(new PluginTocPlugin());
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

    Log.d("onMethodCall", "Start call of channel method");

    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
      return;
    }

    if (call.method.equals("capturaBack")) {

      this.pendingResult = result;
      ArrayList arguments = (ArrayList) call.arguments;

      Intent intent = new Intent(activity, CaptureActivity.class);
      intent.putExtra("document_type", (String) arguments.get(0));
      intent.putExtra("session_id", (String) arguments.get(1));
      intent.putExtra("document_side", "back");

      try {
        activity.startActivityForResult(intent, IDCodeBack);
      } catch (Exception e) {
        Log.e("onMethodCall", "Error capturaBack on startActivityForResult");
        result.error("501","CaptureActivity capturaBack" , e.getMessage());
      }

      return;
    }

    if (call.method.equals("capturaFront")) {

      this.pendingResult = result;
      ArrayList arguments = (ArrayList) call.arguments;

      Intent intent = new Intent(activity, CaptureActivity.class);
      intent.putExtra("document_type", (String) arguments.get(0));
      intent.putExtra("session_id", (String) arguments.get(1));
      intent.putExtra("document_side", "front");

      try {
        activity.startActivityForResult(intent, IDCodeFront);
      } catch (Exception e) {
        Log.e("onMethodCall", "Error capturaFront on startActivityForResult");
        result.error("501","CaptureActivity capturaFront" , e.getMessage());
      }

      return;
    }

    
    if (call.method.equals("capturaLiveness")) {

            this.pendingResult = result;
            ArrayList arguments = (ArrayList) call.arguments;

            Intent intent = new Intent(activity, LivenessIntro.class);
            intent.putExtra("session_id", (String) arguments.get(0));
			
			try {
				activity.startActivityForResult(intent, IDCodeLive);
        } catch (Exception e) {
				Log.e("onMethodCall", "Error capturaLiveness on startActivityForResult");
				result.error("501","CaptureActivity capturaLiveness" , e.getMessage());
        }
			
      return;
    }



    result.notImplemented();
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding activityPluginBinding) {
    activity = activityPluginBinding.getActivity();
    activityPluginBinding.addActivityResultListener(this);
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding activityPluginBinding) {
  }

  @Override
  public void onDetachedFromActivity() {
    activity = null;
  }

  @Override
  public boolean onActivityResult(int requestCode, int resultCode, Intent data) {

    Log.d("PluginTocPlugin.onActivityResult", "requestCode : " + String.valueOf(requestCode));
    Log.d("PluginTocPlugin.onActivityResult", "resultCode : " + String.valueOf(resultCode));

    if (requestCode == IDCodeLive && pendingResult != null) {

      if (resultCode == RESULT_OK) {
        String toc_token = data.getStringExtra("liveness_token");
        pendingResult.success(toc_token);
      } else if (resultCode == RESULT_CANCELED) {
        pendingResult.error("444", "Error capturaLiveness", "Result canceled");
      } else if (resultCode == 401) {
        pendingResult.error("401", "Error capturaLiveness", "Not authorized");
      } else if (resultCode == 405) {
        pendingResult.error("405", "Error capturaLiveness", "Method Not Allowed");
      } else {
        pendingResult.error("500", "Error capturaLiveness", "Unknown error : " + String.valueOf(resultCode));
      }
      pendingResult = null;
    }

    if (requestCode == IDCodeFront && data != null && pendingResult != null) {
      if (resultCode == 200) {
        String toc_token_front = data.getStringExtra("capture_token");
        pendingResult.success(toc_token_front);

      } else {
        pendingResult.error(String.valueOf(resultCode), "Error capturaFront ", "Unknown error : " + String.valueOf(resultCode));
      }
      pendingResult = null;
    }

    if (requestCode == IDCodeBack && data != null && pendingResult != null) {
      if (resultCode == 200) {
        String toc_token_back = data.getStringExtra("capture_token");
        pendingResult.success(toc_token_back);
      } else {
        pendingResult.error(String.valueOf(resultCode), "Error capturaBack ", "Unknown error : " + String.valueOf(resultCode));
      }
      pendingResult = null;
    }

    return true;
  }

}


