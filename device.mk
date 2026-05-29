# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

LOCAL_PATH := device/xiaomi/ice

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Build hacks
PRODUCT_ENFORCE_VINTF_MANIFEST := false
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# vendor
$(call inherit-product, vendor/xiaomi/ice/ice-vendor.mk)

AB_OTA_UPDATER := true

# A/B support
PRODUCT_PACKAGES += \
    com.android.hardware.boot \
    android.hardware.boot-service.default_recovery

PRODUCT_PACKAGES += \
    create_pl_dev \
    create_pl_dev.recovery

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# OTA postinstall
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

# API levels
PRODUCT_SHIPPING_API_LEVEL := 31

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6761:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mt6761

PRODUCT_PRODUCT_PROPERTIES += \
    ro.product.first_api_level=31

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/init.recovery.mt6761.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6761.rc \
    $(LOCAL_PATH)/recovery/init.recovery.usb.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.usb.rc \
    $(LOCAL_PATH)/recovery/ueventd.mt6761.rc:$(TARGET_COPY_OUT_RECOVERY)/root/ueventd.mt6761.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/system/vendor/focaltech_ts_fw_helitai.bin:$(TARGET_COPY_OUT_RECOVERY)/root/system/vendor/focaltech_ts_fw_helitai.bin \
    $(LOCAL_PATH)/recovery/root/system/vendor/novatek_ts_truly_fw.bin:$(TARGET_COPY_OUT_RECOVERY)/root/system/vendor/novatek_ts_truly_fw.bin \
    $(LOCAL_PATH)/recovery/root/system/vendor/novatek_ts_truly_mp.bin:$(TARGET_COPY_OUT_RECOVERY)/root/system/vendor/novatek_ts_truly_mp.bin

# Recovery first stage ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/first_stage_ramdisk/fstab.mt6761:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.mt6761


PRODUCT_PACKAGES += \

PRODUCT_PACKAGES += \

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-mtkimpl.recovery \
    libmtk_bsg.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# MTK Preloader Utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils.recovery

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl

PRODUCT_COPY_FILES += \
    $(OUT_DIR)/target/product/ice/vendor/bin/hw/android.hardware.gatekeeper@1.0-service:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/android.hardware.gatekeeper@1.0-service \
    $(OUT_DIR)/target/product/ice/vendor/lib/hw/android.hardware.gatekeeper@1.0-impl.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib/hw/android.hardware.gatekeeper@1.0-impl.so

# Additional Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster41 \
    libpuresoftkeymasterdevice

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

# Manifest
DEVICE_MANIFEST_FILE := device/xiaomi/ice/vintf/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(LOCAL_PATH)/vintf/compatibility_matrix.xml
