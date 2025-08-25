package com.dandelion.app.activities.models

import com.dandelion.app.R
import com.dandelion.app.activities.baseURL
import dev.hotwire.navigation.navigator.NavigatorConfiguration
import dev.hotwire.navigation.tabs.HotwireBottomTab

private val events = HotwireBottomTab(
    title = "Events",
    iconResId = android.R.drawable.ic_menu_mapmode,
    configuration = NavigatorConfiguration(
        name = "events",
        navigatorHostId = R.id.events_nav_host,
        startLocation = "$baseURL/events"
    )
)

private val organisations = HotwireBottomTab(
    title = "Organisations",
    iconResId = android.R.drawable.ic_menu_manage,
    configuration = NavigatorConfiguration(
        name = "organisations",
        navigatorHostId = R.id.organisations_nav_host,
        startLocation = "$baseURL/organisations"
    )
)

val mainTabs = listOf(
    events,
    organisations
)
