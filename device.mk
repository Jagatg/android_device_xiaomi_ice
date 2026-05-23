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
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6761:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.mt6761

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/system/vendor/focaltech_ts_fw_helitai.bin:$(TARGET_COPY_OUT_RECOVERY)/root/system/vendor/focaltech_ts_fw_helitai.bin \
    $(LOCAL_PATH)/recovery/root/system/vendor/novatek_ts_truly_fw.bin:$(TARGET_COPY_OUT_RECOVERY)/root/system/vendor/novatek_ts_truly_fw.bin \
    $(LOCAL_PATH)/recovery/root/system/vendor/novatek_ts_truly_mp.bin:$(TARGET_COPY_OUT_RECOVERY)/root/system/vendor/novatek_ts_truly_mp.bin

# Recovery first stage ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/first_stage_ramdisk/fstab.mt6761:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.mt6761


