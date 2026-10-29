# Pudding runtime-validated fixes and candidates; see unified-fix3 audit before flashing.
PRODUCT_PACKAGES += \
    PuddingNetworkStackOverlay \
    MiuiCameraPudding \
    libcamera_algoup_jni.pudding \
    libcamera_mianode_jni.pudding \
    QPerformance \
    UxPerformance \
    QXPerformance

PRODUCT_COPY_FILES += \
    device/xiaomi/pudding/postboot-fix3/nfc/etc/libnfc-nci.conf:$(TARGET_COPY_OUT_ODM)/etc/libnfc-nci.conf \
    device/xiaomi/pudding/postboot-fix3/nfc/etc/st54l_conf.txt:$(TARGET_COPY_OUT_ODM)/etc/st54l_conf.txt \
    device/xiaomi/pudding/postboot-fix3/nfc/firmware/st54l_fw.bin:$(TARGET_COPY_OUT_ODM)/firmware/st54l_fw.bin \
    vendor/xiaomi/camera/configs/permissions/miuicamera-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/miuicamera-hiddenapi-package-whitelist.xml \
    device/xiaomi/pudding/postboot-fix3/init.pudding-postboot.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.pudding-postboot.rc

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.nfc.default.conf=st54l_conf.txt \
    ro.vendor.nfc.customRF=1 \
    ro.vendor.nfc.RF.conf.items=8

# ST HAL requires its separate firmware and RF path configuration.
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/nfc/etc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_ODM)/etc/libnfc-hal-st.conf
# Java boost wrappers also require their JNI implementation and broker.
PRODUCT_PACKAGES += libqti_performance libbeluga perfservice libskewknob_system
PRODUCT_COPY_FILES += \
    vendor/qcom/common/system/perf/proprietary/system/etc/permissions/com.qualcomm.qti.Performance.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.qualcomm.qti.Performance.xml \
    vendor/qcom/common/system/perf/proprietary/system/etc/permissions/com.qualcomm.qti.UxPerformance.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.qualcomm.qti.UxPerformance.xml \
    vendor/qcom/common/system/perf/proprietary/system_ext/etc/init/perfservice.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/perfservice.rc \
    vendor/qcom/common/system/perf/proprietary/system_ext/etc/seccomp_policy/perfservice.policy:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/seccomp_policy/perfservice.policy
$(call inherit-product, device/xiaomi/pudding/postboot-fix3/vibrator-stock318/vibrator.mk)

$(call inherit-product, device/xiaomi/pudding/postboot-fix3/thales/thales.mk)

# BoostFramework now uses Class.forName; Zygote preloads the matching JNI.
PRODUCT_BOOT_JARS += QPerformance UxPerformance

# Original HyperOS dual ALS policy, loaded only on pudding.
PRODUCT_PACKAGES += PuddingStockBrightness PuddingBrightnessFrameworkResources

# Complete the stock workload classification path (model JNI dependencies install transitively).
PRODUCT_PACKAGES += workloadclassifier libqti_workloadclassifiermodel
PRODUCT_COPY_FILES += vendor/qcom/common/system/perf/proprietary/system_ext/etc/perf/wlc_model.tflite:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/perf/wlc_model.tflite

PRODUCT_COPY_FILES += vendor/qcom/common/system/perf/proprietary/system_ext/etc/perf/scaler_params.pb:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/perf/scaler_params.pb

# Exact pudding panel identity from stock335 odm/etc/build.prop.
PRODUCT_ODM_PROPERTIES += \
    vendor.display.demura_primary_panel_override_low=175 \
    vendor.display.demura_primary_panel_override_high=8448

# Stock pudding disables the legacy fb0 whitepoint calibration interface.
PRODUCT_ODM_PROPERTIES += ro.vendor.whitepoint_calibration_enable=false

# Bootclasspath jars and JNI must be visible to the platform namespace.
PRODUCT_SOONG_NAMESPACES += vendor/qcom/common/system/perf

# Keep the exact tested WLC inference libraries private to avoid platform TF Lite ABI collisions.
PRODUCT_PACKAGES += libpudding_wlc_tflite libpudding_wlc_textclassifier_hash
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/camera-firmware/pudding_ofilm_s5kjn5_bu24619_tele_ii_ois.coeff:$(TARGET_COPY_OUT_ODM)/firmware/pudding_ofilm_s5kjn5_bu24619_tele_ii_ois.coeff
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/camera-firmware/pudding_ofilm_s5kjn5_bu24619_tele_ii_ois.mem:$(TARGET_COPY_OUT_ODM)/firmware/pudding_ofilm_s5kjn5_bu24619_tele_ii_ois.mem
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/camera-firmware/pudding_ofilm_s5kjn5_bu24619_tele_ii_ois.pher:$(TARGET_COPY_OUT_ODM)/firmware/pudding_ofilm_s5kjn5_bu24619_tele_ii_ois.pher
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/camera-firmware/pudding_ofilm_s5kjn5_bu24619_tele_ii_ois.prog:$(TARGET_COPY_OUT_ODM)/firmware/pudding_ofilm_s5kjn5_bu24619_tele_ii_ois.prog
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/camera-firmware/pudding_sunny_s5kjn5_bu24619_tele_i_ois.coeff:$(TARGET_COPY_OUT_ODM)/firmware/pudding_sunny_s5kjn5_bu24619_tele_i_ois.coeff
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/camera-firmware/pudding_sunny_s5kjn5_bu24619_tele_i_ois.mem:$(TARGET_COPY_OUT_ODM)/firmware/pudding_sunny_s5kjn5_bu24619_tele_i_ois.mem
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/camera-firmware/pudding_sunny_s5kjn5_bu24619_tele_i_ois.pher:$(TARGET_COPY_OUT_ODM)/firmware/pudding_sunny_s5kjn5_bu24619_tele_i_ois.pher
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/camera-firmware/pudding_sunny_s5kjn5_bu24619_tele_i_ois.prog:$(TARGET_COPY_OUT_ODM)/firmware/pudding_sunny_s5kjn5_bu24619_tele_i_ois.prog

# Explicit privileged permissions requested by the platform-signed camera.
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/camera/privapp-permissions-pudding-camera.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-pudding-camera.xml

# Exact panel subpixel rendering configuration; physical text clarity verified.
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/display-spr/spr_cfg_xiaomi_p3_42_02_0a_vhm_mode_dsc_dsi_panel.xml:$(TARGET_COPY_OUT_ODM)/etc/spr_cfg_xiaomi_p3_42_02_0a_vhm_mode_dsc_dsi_panel.xml

# Exact original HyperOS318 device identifiers from the pre-flash backup.
PRODUCT_BRAND_FOR_ATTESTATION := Xiaomi
PRODUCT_DEVICE_FOR_ATTESTATION := pudding
PRODUCT_MANUFACTURER_FOR_ATTESTATION := Xiaomi
# Original HyperOS bootimage/system_dlkm/vendor_dlkm identify this CN device as 25113PN0EC.
# All five property-attestation fields were isolated; only global EG model was rejected by KeyMint.
PRODUCT_MODEL_FOR_ATTESTATION := 25113PN0EC
PRODUCT_NAME_FOR_ATTESTATION := pudding

# VPP-only secure CDSP naming compatibility and matching factory DSP dependencies.
PRODUCT_PACKAGES += libpudding_vpp_legacy_route libsvswdsp libsvswdsp_skel

# Original MiSys implementation; camera persistence only, no HypSys diagnostics.
PRODUCT_PACKAGES += pudding-misys-service

PRODUCT_PACKAGES += pudding-misys-core-service

PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/init.pudding.radio-control.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.pudding.radio-control.rc

# The stock QTI meter requires QPT telemetry enabled after HAL startup.
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/init.pudding-powerstats.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.pudding-powerstats.rc

# Stock IMS VT is required even for voice calls carrying video ringback.
PRODUCT_PACKAGES += pudding-imsvtdaemon pudding-imsvt-aidl
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/imsvt/etc/seccomp_policy/imsvtdaemon.policy:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/seccomp_policy/imsvtdaemon.policy
