#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/ice

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_ENFORCE_VINTF_MANIFEST := false
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

AB_OTA_UPDATER := true

PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B support
PRODUCT_PACKAGES += \
    com.android.hardware.boot \
    android.hardware.boot-service.default_recovery

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
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Preloader Utility
PRODUCT_PACKAGES += \
    create_pl_dev \
    create_pl_dev.recovery

# API levels
PRODUCT_SHIPPING_API_LEVEL := 31

PRODUCT_PRODUCT_PROPERTIES += \
    ro.product.first_api_level=31

#Recovery
PRODUCT_PACKAGES += \
    init.recovery.mt6761.rc

PRODUCT_COPY_FILES += \
    vendor/xiaomi/ice/proprietary/vendor/firmware/focaltech_ts_fw_helitai.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/focaltech_ts_fw_helitai.bin \
    vendor/xiaomi/ice/proprietary/vendor/firmware/novatek_ts_truly_fw.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/novatek_ts_truly_fw.bin \
    vendor/xiaomi/ice/proprietary/vendor/firmware/novatek_ts_truly_mp.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/novatek_ts_truly_mp.bin

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Boot Control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery \
    libmtk_bsg.recovery

# Manifest
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/vintf/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(LOCAL_PATH)/vintf/compatibility_matrix.xml

# Properties
TARGET_SYSTEM_PROP += device/xiaomi/ice/config/prop/system.prop
TARGET_VENDOR_PROP += device/xiaomi/ice/config/prop/vendor.prop
TARGET_PRODUCT_PROP += device/xiaomi/ice/config/prop/product.prop

# SystemUI Go
PRODUCT_PACKAGES += \
    SystemUIGo



PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1.so \
    android.hardware.boot@1.2-service \
    android.hardware.cas@1.2-service-lazy \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.wifi@1.0-service-lazy \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.audio.effect@7.0-impl \
    dmabuf_dump.vendor \
    vndservicemanager \
    vndservice \
    android.hardware.bluetooth.audio@2.1-impl \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.renderscript@1.0-impl \
    android.hardware.soundtrigger@2.3-impl \
    android.hardware.soundtrigger@2.3-impl \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@2.0-impl \
    android.hardware.thermal@2.0.vendor \
    audio.r_submix.default \
    audio.usb.default \
    libtinyalsa \
    libaudioutils \
    audio_policy.stub \
    android.hardware.drm@1.4-service-lazy.clearkey

PRODUCT_PACKAGES += \
    libcamera2ndk_vendor.vendor \
    libcodec2_hidl@1.1.vendor \
    libcodec2_hidl@1.2.vendor \
    libcodec2_hidl_plugin.vendor \
    libcodec2_soft_common.vendor \
    libcppbor_external.vendor \
    libcppcose_rkp.vendor \
    libkeymaster4.vendor \
    libkeymaster41.vendor \
    libkeymaster4_1support.vendor \
    libkeystore-engine-wifi-hidl.vendor \
    libkeystore-wifi-hidl.vendor \
    libsensorndkbridge.vendor \
    libsfplugin_ccodec_utils.vendor \
    libsoft_attestation_cert.vendor \
    libstagefright_bufferpool@2.0.1.vendor \

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0.vendor \
    android.hardware.audio@7.0.vendor \
    android.hardware.audio@7.0-util.vendor

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth@1.1.vendor

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.common@1.0.vendor \
    android.hardware.camera.device@1.0.vendor \
    android.hardware.camera.device@3.2.vendor \
    android.hardware.camera.device@3.3.vendor \
    android.hardware.camera.device@3.4.vendor \
    android.hardware.camera.device@3.5.vendor \
    android.hardware.camera.device@3.6.vendor \
    android.hardware.camera.provider@2.4.vendor \
    android.hardware.camera.provider@2.5.vendor \
    android.hardware.camera.provider@2.6.vendor

# Dumpstate
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.0.vendor \
    android.hardware.dumpstate@1.1.vendor

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss.measurement_corrections@1.0.vendor \
    android.hardware.gnss.measurement_corrections@1.1.vendor \
    android.hardware.gnss.visibility_control@1.0.vendor \
    android.hardware.gnss@1.0.vendor \
    android.hardware.gnss@1.1.vendor \
    android.hardware.gnss@2.0.vendor \
    android.hardware.gnss@2.1.vendor

# Light
PRODUCT_PACKAGES += \
    android.hardware.light@2.0.vendor

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0.vendor \
    android.hardware.power@1.1.vendor \
    android.hardware.power@1.2.vendor

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio.config@1.0.vendor \
    android.hardware.radio.config@1.1.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio.config@1.3.vendor \
    android.hardware.radio@1.2.vendor \
    android.hardware.radio@1.3.vendor \
    android.hardware.radio@1.4.vendor \
    android.hardware.radio@1.5.vendor \
    android.hardware.radio@1.6.vendor

# Sensor
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-ScopedWakelock.vendor \
    android.hardware.sensors@2.0.vendor \
    android.hardware.sensors@2.1.vendor

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb.gadget@1.0.vendor \
    android.hardware.usb.gadget@1.1.vendor \
    android.hardware.usb@1.0.vendor \
    android.hardware.usb@1.1.vendor \
    android.hardware.usb@1.2.vendor \
    android.hardware.usb@1.3.vendor

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.0.vendor \
    android.hardware.wifi.hostapd@1.1.vendor \
    android.hardware.wifi.hostapd@1.2.vendor \
    android.hardware.wifi.hostapd@1.3.vendor \
    android.hardware.wifi.supplicant@1.0.vendor \
    android.hardware.wifi.supplicant@1.1.vendor \
    android.hardware.wifi.supplicant@1.2.vendor \
    android.hardware.wifi.supplicant@1.3.vendor \
    android.hardware.wifi.supplicant@1.4.vendor

# Memory
PRODUCT_PACKAGES += \
    android.hidl.memory.block@1.0.vendor

PRODUCT_PACKAGES += \
    libavservices_minijail_vendor \
    libtinycompress

PRODUCT_PACKAGES += \
    libdrm.vendor \
    libhidltransport.vendor \
    libhwbinder.vendor \

# Chipinfo
PRODUCT_PACKAGES += \
    chipinfo

# libaedv
PRODUCT_PACKAGES += \
    libaedv

# walan_assistant
PRODUCT_PACKAGES += \
    wlan_assistant
