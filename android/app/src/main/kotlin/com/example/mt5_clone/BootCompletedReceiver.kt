// Path: android/app/src/main/kotlin/com/example/mt5_clone/BootCompletedReceiver.kt
package com.example.mt5_clone

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

class BootCompletedReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == Intent.ACTION_BOOT_COMPLETED || intent.action == "android.intent.action.QUICKBOOT_POWERON") {
            // Restart EAs
        }
    }
}
