# Original hardware is Thales; retain existing VINTF instances and executable labels.
PRODUCT_PACKAGES := $(filter-out android.hardware.security.keymint3-service.strongbox.nxp android.hardware.weaver-service.nxp,$(PRODUCT_PACKAGES))
PRODUCT_PACKAGES += PuddingThalesStrongbox PuddingThalesWeaver PuddingThales_ese_weaver_thales PuddingThales_libcppbor PuddingThales_libcppbor_external PuddingThales_libjc_keymint_thales PuddingThales_libjc_keymint_transport_thales PuddingThales_libjc_weaver_transport PuddingThales_libkeymint_empty_thales PuddingThales_libweaver_empty_thales PuddingThales_vendor_xiaomi_hardware_miauthsecretd_V1_ndk
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/thales/strongbox.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.security.keymint3-service.strongbox.nxp.rc
PRODUCT_COPY_FILES += device/xiaomi/pudding/postboot-fix3/thales/weaver.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.weaver-service.nxp.rc
