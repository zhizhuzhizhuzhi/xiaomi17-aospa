# SPDX-License-Identifier: Apache-2.0
# Optional private release mapping; ordinary development builds keep upstream defaults.
ifneq ($(strip $(PUDDING_RELEASE_KEYS)),)
# Private keys stay outside the source checkout.
PRODUCT_DEFAULT_DEV_CERTIFICATE := $(PUDDING_RELEASE_KEYS)/releasekey

# Explicit certificate modules do not inherit the default signing directory.
PRODUCT_CERTIFICATE_OVERRIDES += \
    AdServicesApk:pudding_release_apk_0f6dd9980d71f76c \
    FederatedCompute:pudding_release_apk_5db1a1655a7b61eb \
    HealthConnectBackupRestore:pudding_release_apk_248ef17aaa3c6410 \
    HealthConnectController:pudding_release_apk_6c19501e0a8b56a4 \
    OsuLogin:pudding_release_apk_e9c6e824f416c46b \
    SafetyCenterResources:pudding_release_apk_d4d39c99f253363c \
    ServiceConnectivityResources:pudding_release_apk_9005d650e02e8ab0 \
    ServiceUwbResources:pudding_release_apk_aa50d81e2f641cb9 \
    ServiceWifiResources:pudding_release_apk_5289d06d94e9a895 \
    WebAppService:pudding_release_apk_546b0c8d0109c6fe \
    WifiDialog:pudding_release_apk_f10b4bcb640b919f \
    art_fake_com.android.os.statsd:pudding_release_apk_4fa9b40a16518e13 \
    com.android.adbd-defaults:pudding_release_apk_f28d1ead8be9d5fa \
    com.android.adservices:pudding_release_apk_08eef3390629c20d \
    com.android.adservices.fullmodule:pudding_release_apk_08eef3390629c20d \
    com.android.adservices.smallmodule:pudding_release_apk_08eef3390629c20d \
    com.android.appsearch:pudding_release_apk_6ac112bff7ea200c \
    com.android.appsearch.apk:pudding_release_apk_6ed418a6da92ab60 \
    com.android.art-base-defaults:pudding_release_apk_4fa9b40a16518e13 \
    com.android.bt:pudding_release_apk_2deea71bb35b4726 \
    com.android.cellbroadcast-defaults:pudding_release_apk_241c017d0a93e257 \
    com.android.configinfrastructure:pudding_release_apk_fb1a78ae39767ad7 \
    com.android.conscrypt-defaults:pudding_release_apk_043dc545a1466d47 \
    com.android.crashrecovery:pudding_release_apk_5fd48190e5efcacf \
    com.android.devicelock:pudding_release_apk_7901c2de722fff1e \
    com.android.extservices-defaults:pudding_release_apk_2a6341f6f847a67a \
    com.android.hardware.audio:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.authsecret:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.biometrics.face.virtual:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.biometrics.fingerprint.virtual:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.boot:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.cas:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.contexthub:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.drm.clearkey:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.drm.clearkey.lazy:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.dumpstate:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.gnss:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.graphics.composer.drm_hwcomposer:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.graphics.composer.ranchu:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.input.processor:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.keymint.rust_nonsecure:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.memtrack:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.net.nlinterceptor:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.neuralnetworks:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.power:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.radio.minradio.virtual:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.rebootescrow:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.secure_element:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.secure_element_jcardsim:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.security.authgraph:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.security.secretkeeper:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.sensors:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.tetheroffload:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.thermal:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.threadnetwork:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.usb:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.uwb:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.vibrator:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.wifi:pudding_release_apk_349f3751afe98d6d \
    com.android.hardware.wpa_supplicant:pudding_release_apk_349f3751afe98d6d \
    com.android.healthfitness:pudding_release_apk_4fe5c17f20f61000 \
    com.android.i18n:pudding_release_apk_2cb01f958f1a1099 \
    com.android.ipsec-defaults:pudding_release_apk_cea101169e8b0d54 \
    com.android.media-defaults:pudding_release_apk_d28b3d8a137821d5 \
    com.android.media.swcodec-defaults:pudding_release_apk_33f5cfc39b60e78a \
    com.android.mediaprovider-defaults:pudding_release_apk_f363438e2cb033a7 \
    com.android.neuralnetworks-defaults:pudding_release_apk_62094dc215fe0a24 \
    com.android.nfcservices:pudding_release_apk_b94a70a3e89f99f1 \
    com.android.npumanager:pudding_release_apk_3982ba0834918126 \
    com.android.os.statsd-defaults:pudding_release_apk_f9236ef86b15a507 \
    com.android.permission-defaults:pudding_release_apk_3ce99b3c829ab680 \
    com.android.profiling:pudding_release_apk_c16e025b6d2f9c0f \
    com.android.resolv:pudding_release_apk_3623a7be9de3b618 \
    com.android.rkpd:pudding_release_apk_e36702ab35c944c8 \
    com.android.runtime:pudding_release_apk_27c2767b12e187e8 \
    com.android.scheduling:pudding_release_apk_4574a69d73f8acaf \
    com.android.sdkext-defaults:pudding_release_apk_86bf84fde3132ecf \
    com.android.telephonycore:pudding_release_apk_21679c0d7ed24c8d \
    com.android.tzdata-defaults:pudding_release_apk_265d25285e882386 \
    com.android.uprobestats:pudding_release_apk_33dd50902ee1f800 \
    com.android.uwb-defaults:pudding_release_apk_a7e279fb3846f70e \
    com.android.virt:pudding_release_apk_09ee3c317b90ea70 \
    com.android.webapp:pudding_release_apk_546b0c8d0109c6fe \
    com.android.wifi-defaults:pudding_release_apk_0712cd3ff374f92f \
    com.google.android.hardware.nfc.st:pudding_release_apk_349f3751afe98d6d \
    com.google.cf.wpa_supplicant:pudding_release_apk_349f3751afe98d6d \
    com.google.emulated.camera.provider.hal.defaults:pudding_release_apk_349f3751afe98d6d \
    com.google.emulated.camera.provider.hal.v4l2:pudding_release_apk_349f3751afe98d6d \
    test.bad1.com.android.hardware.wifi:pudding_release_apk_349f3751afe98d6d \
    test.bad2.com.android.hardware.wifi:pudding_release_apk_349f3751afe98d6d \
    test.good1.com.android.hardware.wifi:pudding_release_apk_349f3751afe98d6d

# This product is compiled directly with the audited private release keys.
override BUILD_KEYS := release-keys

# Align Soong metadata with the audited private APK/APEX/AVB release keys.
# The userdebug build variant remains accurately identified.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildKeys=release-keys \
    BuildVersionTags=release-keys \
    BuildDesc=$(PRODUCT_NAME)-$(TARGET_BUILD_VARIANT) $(PLATFORM_VERSION) $(BUILD_ID) os4a20261023 release-keys

# Require host RSA authorization even on this unlocked userdebug device.
PRODUCT_SYSTEM_PROPERTIES += ro.adb.secure=1

endif
