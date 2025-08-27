package com.dandelion.app

import android.app.Application
import com.dandelion.app.activities.baseURL
import com.dandelion.app.components.ButtonComponent
import dev.hotwire.core.bridge.BridgeComponentFactory
import dev.hotwire.core.bridge.KotlinXJsonConverter
import dev.hotwire.core.config.Hotwire
import dev.hotwire.core.turbo.config.PathConfiguration
import dev.hotwire.navigation.config.registerBridgeComponents
import dev.hotwire.navigation.config.registerFragmentDestinations
import dev.hotwire.navigation.fragments.HotwireWebFragment

class DandelionApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        Hotwire.loadPathConfiguration(
            context = this,
            location = PathConfiguration.Location(
                remoteFileUrl = "$baseURL/configurations/android_v1.json"
            )
        )

        Hotwire.registerFragmentDestinations(
            HotwireWebFragment::class
        )

        Hotwire.registerBridgeComponents(
            BridgeComponentFactory("button", ::ButtonComponent)
        )

        Hotwire.config.jsonConverter = KotlinXJsonConverter()
    }
}
