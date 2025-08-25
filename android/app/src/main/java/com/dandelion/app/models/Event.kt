package com.dandelion.app.models

import com.google.android.gms.maps.model.LatLng

data class Event(
    val name: String,
    val latitude: Double,
    val longitude: Double
) {
    val coordinate: LatLng
        get() = LatLng(latitude, longitude)
}
