#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/ice

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/mediatek \
    hardware/mediatek/audio \
    hardware/mediatek/utils/libmtkperf_client

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Audio package for Go
$(call inherit-product, frameworks/base/data/sounds/AudioPackageGo.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_BOOT_ANIMATION_RES := 720

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# GMS
ifeq ($(WITH_GMS),true)
GMS_MAKEFILE=gms_minimal.mk
endif

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
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Certs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,system/ca-certificates/files/,$(TARGET_COPY_OUT_VENDOR)/etc/security/cacerts)

# API levels
PRODUCT_SHIPPING_API_LEVEL := 31

PRODUCT_PRODUCT_PROPERTIES += \
    ro.product.first_api_level=31

PRODUCT_PACKAGES += \
    init.recovery.mt6761.rc

PRODUCT_COPY_FILES += \
    vendor/xiaomi/ice/proprietary/vendor/firmware/focaltech_ts_fw_helitai.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/focaltech_ts_fw_helitai.bin \
    vendor/xiaomi/ice/proprietary/vendor/firmware/novatek_ts_truly_fw.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/novatek_ts_truly_fw.bin \
    vendor/xiaomi/ice/proprietary/vendor/firmware/novatek_ts_truly_mp.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/novatek_ts_truly_mp.bin

PRODUCT_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

# Audio
TARGET_EXCLUDES_AUDIOFX := true

PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
WITH_DEXPREOPT_DEBUG_INFO := false
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/boot/boot-image-profile.txt
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true

# Reduce system server debug info
PRODUCT_SYSTEM_SERVER_DEBUG_INFO := false
USE_DEX2OAT_DEBUG := false

PRODUCT_DEXPREOPT_SPEED_APPS += SystemUIGo \
    Settings \
    TeleService \
    PhhIms \
    Dialer \
    Contacts \
    messaging \
    DocumentsUI \
    CredentialManager \
    Aperture \
    Glimpse \
    Twelve \
    Etar \
    StorageManager

# Overlays
$(call inherit-product, hardware/mediatek/overlay/mssi.mk)

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery \
    libmtk_bsg.recovery \
    libmtk_bsg

# libInit
$(call soong_config_set,libinit,vendor_init_lib,//$(LOCAL_PATH):init_xiaomi_ice)

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Manifest
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(LOCAL_PATH)/compatibility_matrix.xml

# Properties
TARGET_SYSTEM_PROP += device/xiaomi/ice/system.prop
TARGET_VENDOR_PROP += device/xiaomi/ice/vendor.prop

# This should fix crash of Surface Flinger
PRODUCT_VENDOR_PROPERTIES += \
    debug.renderengine.backend=gles

# Rootdir
PRODUCT_PACKAGES += \
    fstab.enableswap \
    fstab.mt6761 \
    fstab.mt6761.ramdisk \
    init.cgroup.rc \
    init.connectivity.common.rc \
    init.connectivity.rc \
    init.ice.power.rc \
    init.modem.rc \
    init.mt6761.rc \
    init.mt6761.usb.rc \
    init.project.rc \
    init.sensor_1_0.rc \
    init.zram.rc \
    init_connectivity.rc \
    init.insmod.sh \
    init.ago.rc \
    init_connectivity.rc

PRODUCT_PROPERTY_OVERRIDES += fw.max_users=1

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

PRODUCT_PACKAGES += \
    Dialer

# BesLoudness
PRODUCT_PACKAGES += \
    BesLoudness

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/AudioParamOptions.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_param/AudioParamOptions.xml \
    $(LOCAL_PATH)/configs/audio/AudioParamOptions_vext.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_param/AudioParamOptions_vext.xml

PRODUCT_PACKAGES += \
    Launcher3QuickStepGo \
    NoNavigationBarModeGestural

# Keep foreground heap growth bounded on low-memory devices.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.foreground-heap-growth-multiplier=1.0

DONT_UNCOMPRESS_PRIV_APPS_DEXS := true

PRODUCT_PACKAGES += \
    chipinfo \
    wlan_assistant \
    libaedv

# MTK perf
PRODUCT_PACKAGES += \
    libmtkperf_client_vendor \
    libpowerhalwrap_vendor \
    libperfctl_vendor

# RRO
PRODUCT_PACKAGES += \
    CarrierConfigOverlayIce \
    IceFrameworkOverlay \
    IceSystemUIOverlay \
    DialerOverlayIce \
    ApertureOverlayIce \
    IceFrameworkResOverlay \
    IceFrameworkResOverlayExt \
    FrameworkResOverlayAnim

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/media/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuilts/modules,$(TARGET_COPY_OUT_VENDOR)/lib/modules)

# Biometrics
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1.vendor

# CAS
PRODUCT_PACKAGES += \
    android.hardware.cas@1.2-service-lazy

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-service

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.bluetooth.audio@2.1-impl \
    audio.r_submix.default \
    audio.bluetooth.default \
    audio.usb.default \
    audio_policy.stub \
    libtinyalsa \
    libaudioutils

PRODUCT_PACKAGES += \
    dmabuf_dump.vendor \
    vndservicemanager \
    vndservice

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl

# Renderscript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Soundtrigger
PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.3-impl

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service-lazy.clearkey \
    libdrm.vendor

# Camera
PRODUCT_PACKAGES += \
    libcamera2ndk_vendor.vendor

# Codec2
PRODUCT_PACKAGES += \
    libcodec2_hidl@1.1.vendor \
    libcodec2_hidl@1.2.vendor \
    libcodec2_hidl_plugin.vendor \
    libcodec2_soft_common.vendor \
    libsfplugin_ccodec_utils.vendor

PRODUCT_PACKAGES += \
    libcppbor_external.vendor \
    libcppcose_rkp.vendor

# Keymaster
PRODUCT_PACKAGES += \
    libkeymaster4.vendor \
    libkeymaster41.vendor \
    libkeymaster4_1support.vendor \
    libsoft_attestation_cert.vendor

PRODUCT_PACKAGES += \
    libsensorndkbridge.vendor \
    libstagefright_bufferpool@2.0.1.vendor

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0.vendor \
    android.hardware.audio@7.0.vendor \
    android.hardware.audio@7.0-util.vendor \
    libaudiofoundation.vendor \
    libtinycompress

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
    android.hardware.dumpstate@1.1.vendor \
    libdumpstateutil.vendor

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss.measurement_corrections@1.0.vendor \
    android.hardware.gnss.measurement_corrections@1.1.vendor \
    android.hardware.gnss.visibility_control@1.0.vendor \
    android.hardware.gnss-V1-ndk_platform.vendor \
    android.hardware.gnss-V2-ndk_platform.vendor \
    android.hardware.gnss-V1-ndk.vendor \
    android.hardware.gnss@1.0.vendor \
    android.hardware.gnss@1.1.vendor \
    android.hardware.gnss@2.0.vendor \
    android.hardware.gnss@2.1.vendor

# Lineage Health
$(call soong_config_set,lineage_health,charging_control_charging_path,/sys/class/power_supply/battery/charging_enabled)
$(call soong_config_set,lineage_health,charging_control_charging_enabled,1)
$(call soong_config_set,lineage_health,charging_control_charging_disabled,0)

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-V2-ndk_platform.vendor \
    android.hardware.power-V2-ndk.vendor \
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
    android.frameworks.sensorservice@1.0.vendor \
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
    android.hardware.wifi-service \
    libwifi-hal-wrapper \
    libwifi-system-iface.vendor \
    libkeystore-engine-wifi-hidl.vendor \
    libkeystore-wifi-hidl.vendor \
    lib_driver_cmd_mt66xx \
    wpa_supplicant \
    hostapd

$(call soong_config_set_bool,mediatek_wifi_hal,use_pre_u_qpr2_struct,true)

PRODUCT_PACKAGES += \
    android.hardware.audio.service.mediatek

PRODUCT_PACKAGES += \
    libhidltransport.vendor \
    libhwbinder.vendor \
    libavservices_minijail_vendor.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.microphone.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.microphone.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

PRODUCT_PACKAGES += disable_configstore

PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.has_HDR_display=false \
    ro.surface_flinger.has_wide_color_display=false \
    ro.surface_flinger.start_graphics_allocator_service=true \
    ro.surface_flinger.use_context_priority=true

# lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.lineage

# IMS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-com.mediatek.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.mediatek.ims.xml

PRODUCT_PACKAGES += \
    libavservices_minijail_vendor \
    libmemunreachable.vendor \
    libpcap.vendor \

PRODUCT_PACKAGES += \
    android.hardware.power-service-mediatek

PRODUCT_COPY_FILES += \
    out/target/product/ice/system/lib/android.hardware.power-V2-ndk.so:$(TARGET_COPY_OUT_VENDOR)/lib/android.hardware.power-V2-ndk.so

PRODUCT_COPY_FILES += \
    prebuilts/vndk/v31/arm/arch-arm-armv7-a-neon/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhidlbase-v31.so

PRODUCT_COPY_FILES += \
    device/xiaomi/ice/prebuilts/lib/libstagefright_foundation-v31.so:$(TARGET_COPY_OUT_VENDOR)/lib/libstagefright_foundation-v31.so

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0.vendor \
    android.hardware.thermal@2.0.vendor

PRODUCT_PACKAGES += \
    libcurl.vendor \
    libssl.vendor

# Shims
PRODUCT_PACKAGES += \
    libui_shim \
    libaudioclient_shim \
    libui_shim \
    libbase_shim \
    libprocessgroup_shim \
    libshim_utils \
    libutils-shim

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.mediatek \
    android.hardware.vibrator-V2-ndk_platform.vendor

PRODUCT_COPY_FILES += \
    prebuilts/vndk/v34/arm/arch-arm-armv7-a-neon/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib/libutils-v34.so

PRODUCT_PACKAGES += \
    libnl.vendor \
    libprocessgroup.vendor

PRODUCT_COPY_FILES += \
    prebuilts/vndk/v33/arm/arch-arm-armv7-a-neon/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhidlbase-v33.so \
    prebuilts/vndk/v31/arm/arch-arm-armv7-a-neon/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhidlbase-v31.so \
    device/xiaomi/ice/prebuilts/lib/libhidlbase-v34.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhidlbase-v34.so \
    device/xiaomi/ice/prebuilts/lib/libutils-v31.so:$(TARGET_COPY_OUT_VENDOR)/lib/libutils-v31.so \
    out/target/product/ice/system/lib/libwifi-system-iface.so:$(TARGET_COPY_OUT_VENDOR)/lib/libwifi-system-iface.so \
    out/target/product/ice/system_ext/lib/libui_shim.so:$(TARGET_COPY_OUT_SYSTEM)/lib/libui_shim.so

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.example \
    android.hardware.health-service.example_recovery

PRODUCT_PACKAGES += \
    libladder

PRODUCT_PACKAGES += \
    PowerOffAlarm

# Lineage Health
PRODUCT_PACKAGES += \
    vendor.lineage.health-service.default

PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.clear_slots_with_set_layer_buffer=true \
    ro.lmk.swap_free_low_percentage=35 \
    ro.lmk.filecache_min_kb=153600 \
    ro.surface_flinger.supports_background_blur=false

# Low-memory optimizations
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
DEX2OAT_TARGET_INSTRUCTION_SET_FEATURES := div
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# ART compilation resource tuning
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.boot-dex2oat-threads=2 \
    dalvik.vm.dex2oat-threads=2

# ART Service dexopt configuration
PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.bg-dexopt=speed-profile \
    pm.dexopt.boot-after-ota=verify

# IncrementalFS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.incremental.enable=yes

# Watchdog
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hw_timeout_multiplier=6

PRODUCT_PACKAGES += \
    Aperture

PRODUCT_PACKAGES += \
    libexif.vendor \
    libpng.vendor \
    libcamera_metadata.vendor \
    libstagefright_softomx_plugin.vendor

PRODUCT_COPY_FILES += \
    prebuilts/vndk/v31/arm/arch-arm-armv7-a-neon/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib/libutils-v32.so

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.vendor.recovery_update=true

PRODUCT_PACKAGES += \
    android.hardware.hardware_keystore.km41.xml

PRODUCT_PACKAGES += \
    libwifi-hal-wrapper-lib64-link
