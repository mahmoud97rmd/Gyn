// Path: android/app/src/main/kotlin/com/example/mt5_clone/OandaStreamingService.kt
package com.example.mt5_clone

import android.app.Service
import android.content.Intent
import android.os.IBinder

class OandaStreamingService : Service() {
    override fun onBind(intent: Intent?): IBinder? {
        return null
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return START_STICKY
    }
}
