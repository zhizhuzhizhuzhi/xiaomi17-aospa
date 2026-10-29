# AOSPA bring-up for Xiaomi 17, based on lolipuru lineage-24.0.
ifeq ($(TARGET_PRODUCT),aospa_pudding)
TARGET_BOARD_PLATFORM := canoe
TARGET_KERNEL_VERSION := 6.12
TARGET_USES_KERNEL_PLATFORM := false
TARGET_KERNEL_DLKM_DISABLE := true
TARGET_PROVIDES_POWERHAL := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_PREBUILT_KERNEL := device/xiaomi/pudding-kernel-os4/kernel
# Preserve CAF driver configuration without inheriting the older AOSPA QTI stack.
TARGET_PUDDING_CAF_STACK := true
PRODUCT_SOURCE_ROOT_DIRS += -hardware/xiaomi/aidl/touch
#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The AOSPA configuration is inherited after the device configuration.


# Inherit from pudding device.
$(call inherit-product, device/xiaomi/pudding/device.mk)

$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

## Device identifier
PRODUCT_DEVICE := pudding
PRODUCT_NAME := aospa_pudding
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := 25113PN0EC
PRODUCT_MANUFACTURER := Xiaomi


# GMS
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Use the SM8850 CAF providers for this product.
PRODUCT_SOURCE_ROOT_DIRS += -device/qcom/common -device/qcom/vendor-common/memtrack -vendor/qcom/opensource/core-utils/fwk-detect -vendor/qcom/opensource/audio-kernel -vendor/qcom/opensource/display-drivers -vendor/qcom/opensource/dataipa -vendor/aospa/interfaces/qcom/perf -vendor/aospa/interfaces/qcom/btconfigstore -vendor/aospa/interfaces/qcom/capabilityconfigstore

# Other device targets are outside this independent pudding build.
PRODUCT_SOURCE_ROOT_DIRS += -device/xiaomi/sm8550-platform-common -device/xiaomi/fuxi -device/xiaomi/sheng -device/xiaomi/sm8550-common -device/xiaomi/sepolicy -device/xiaomi/sm8550-sheng-common -vendor/xiaomi/sm8550-sheng-common -vendor/xiaomi/sheng -vendor/xiaomi/camera -vendor/xiaomi/sm8550-common -vendor/xiaomi/fuxi

# The pudding stock GNSS stack implements AIDL V4.
PRODUCT_SOURCE_ROOT_DIRS += -hardware/qcom/gps

# Vendor HALs are supplied by the pudding SM8850 stock stack.
PRODUCT_SOURCE_ROOT_DIRS += -vendor/qcom/common/vendor

# Use the SM8850 display, WLAN and audio providers.
PRODUCT_SOURCE_ROOT_DIRS += -hardware/qcom/display -hardware/qcom/wlan -vendor/qcom/opensource/audio-hal/primary-hal

# Export only the CAF SM8850 IPA, boot control and thermal modules to Make.
PRODUCT_SOURCE_ROOT_DIRS += -vendor/qcom/opensource/data-ipa-cfg-mgr -hardware/qcom/bootctrl -vendor/qcom/opensource/thermal-hal
$(call inherit-product, device/xiaomi/pudding/release-signing.mk)
endif
