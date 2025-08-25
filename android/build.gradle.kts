// Top-level build file where you can add configuration options common to all
// sub-projects/modules.
plugins {
    alias(libs.plugins.android.application) apply false
    alias(libs.plugins.kotlin.android) apply false
    alias(libs.plugins.compose.compiler) apply false
    id("org.jetbrains.kotlin.plugin.serialization") version "2.0.0" apply false
}

buildscript {
    dependencies {
        classpath(
            "com.google.android.libraries.mapsplatform" +
                    ".secrets-gradle-plugin:secrets-gradle-plugin:2.0.1"
        )
    }
}
