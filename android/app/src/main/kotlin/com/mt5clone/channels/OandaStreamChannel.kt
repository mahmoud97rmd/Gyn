// Path: android/app/src/main/kotlin/com/mt5clone/channels/OandaStreamChannel.kt
package com.mt5clone.channels

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class OandaStreamChannel : MethodChannel.MethodCallHandler {
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "startBackgroundStream" -> {
                result.success(true)
            }
            "stopBackgroundStream" -> {
                result.success(true)
            }
            else -> result.notImplemented()
        }
    }
}
