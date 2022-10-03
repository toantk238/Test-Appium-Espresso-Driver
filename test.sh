#!/usr/bin/env sh

ROOT_DIR=$PWD

cd android_app
./gradlew clean :app:assembleDebug
adb install -r app/build/outputs/apk/debug/app-debug.apk

cd $ROOT_DIR
cd android_test
./gradlew clean :app:assembleAndroidTest
adb install -r app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk


adb shell am instrument -w -e debug false -e disableAnalytics true io.appium.espressoserver.test/androidx.test.runner.AndroidJUnitRunner