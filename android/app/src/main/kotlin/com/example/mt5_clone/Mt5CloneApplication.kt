// Path: android/app/src/main/kotlin/com/example/mt5_clone/Mt5CloneApplication.kt
package com.example.mt5_clone

import android.app.Application
import android.app.NotificationChannel
import android.app.NotificationManager
import android.os.Build
import com.chaquo.python.Python
import com.chaquo.python.android.AndroidPlatform

class Mt5CloneApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        
        // Initialize Chaquopy
        if (!Python.isStarted()) {
            Python.start(AndroidPlatform(this))
        }

        createNotificationChannels()
        setupCrashHandler()
    }

    private fun createNotificationChannels() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val eaChannel = NotificationChannel(
                "ea_engine_channel",
                "EA Engine Service",
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = "Background service for executing Expert Advisors"
            }

            val streamChannel = NotificationChannel(
                "stream_channel",
                "OANDA Price Stream",
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = "Background service for live price streaming"
            }

            val manager = getSystemService(NotificationManager::class.java)
            manager?.createNotificationChannel(eaChannel)
            manager?.createNotificationChannel(streamChannel)
        }
    }

    private fun setupCrashHandler() {
        val defaultHandler = Thread.getDefaultUncaughtExceptionHandler()
        Thread.setDefaultUncaughtExceptionHandler { thread, exception ->
            // Log crash or notify if needed
            exception.printStackTrace()
            defaultHandler?.uncaughtException(thread, exception)
        }
    }
}
