package com.example.busapp;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.util.Base64;
import android.util.Log;

import androidx.annotation.NonNull;  // Add this import
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.example.busapp/hash";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("getKeyHash")) {
                                try {
                                    PackageInfo info = getPackageManager().getPackageInfo(
                                            getPackageName(),
                                            PackageManager.GET_SIGNATURES);
                                    for (Signature signature : info.signatures) {
                                        MessageDigest md = MessageDigest.getInstance("SHA");
                                        md.update(signature.toByteArray());
                                        String keyHash = Base64.encodeToString(md.digest(), Base64.DEFAULT);
                                        result.success(keyHash);
                                    }
                                } catch (PackageManager.NameNotFoundException | NoSuchAlgorithmException e) {
                                    result.error("ERROR", "Key hash generation failed", e.getMessage());
                                }
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }
}
