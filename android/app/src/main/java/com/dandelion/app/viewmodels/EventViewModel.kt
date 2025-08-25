package com.dandelion.app.viewmodels

import androidx.compose.runtime.mutableStateOf
import androidx.lifecycle.ViewModel
import com.dandelion.app.models.Event
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONObject
import java.net.URL

class EventViewModel(private val url: String) : ViewModel() {
    var event = mutableStateOf<Event?>(null)
        private set

    suspend fun fetchCoordinates() {
        try {
            val data = withContext(Dispatchers.IO) {
                URL(url).readText()
            }
            val json = JSONObject(data)
            event.value = Event(
                name = json.getString("name"),
                latitude = json.getDouble("latitude"),
                longitude = json.getDouble("longitude")
            )
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
}
