package com.dandelion.app.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.ui.platform.ComposeView
import com.google.android.gms.maps.model.CameraPosition
import com.google.maps.android.compose.GoogleMap
import com.google.maps.android.compose.MapProperties
import com.google.maps.android.compose.MapType
import com.google.maps.android.compose.Marker
import com.google.maps.android.compose.rememberCameraPositionState
import com.google.maps.android.compose.rememberMarkerState
import com.dandelion.app.R
import com.dandelion.app.viewmodels.EventViewModel
import dev.hotwire.navigation.destinations.HotwireDestinationDeepLink
import dev.hotwire.navigation.fragments.HotwireFragment

@HotwireDestinationDeepLink(uri = "hotwire://fragment/map")
class MapFragment : HotwireFragment() {
    private lateinit var viewModel: EventViewModel

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        viewModel = EventViewModel(url = "${navigator.location}.json")

        val view = inflater.inflate(R.layout.fragment_map, container, false)
        view.findViewById<ComposeView>(R.id.compose_view).apply {
            setContent {
                MapView(viewModel = viewModel)
            }
        }
        return view
    }
}

@Composable
fun MapView(viewModel: EventViewModel) {
    LaunchedEffect(viewModel) {
        viewModel.fetchCoordinates()
    }

    val event = viewModel.event.value
    if (event != null) {
        val markerState = rememberMarkerState(position = event.coordinate)
        val cameraPositionState = rememberCameraPositionState {
            position = CameraPosition.fromLatLngZoom(event.coordinate, 15f)
        }
        GoogleMap(
            cameraPositionState = cameraPositionState,
            properties = MapProperties(mapType = MapType.HYBRID)
        ) {
            Marker(
                state = markerState,
                title = event.name
            )
        }
    }
}
