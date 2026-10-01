#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    $(LOCAL_PATH)/hidl/audio \
    $(LOCAL_PATH)/utils/libmtkperf_client

LOCAL_PATH := device/xiaomi/ice

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

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

# API levels
PRODUCT_SHIPPING_API_LEVEL := 31

PRODUCT_PRODUCT_PROPERTIES += \
    ro.product.first_api_level=31

PRODUCT_PACKAGES += \
    init.recovery.mt6761.rc

PRODUCT_COPY_FILES += \
    vendor/xiaomi/ice/proprietary/vendor/firmware/focaltech_ts_fw_helitai.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/focaltech_ts_fw_helitai.bin \
    vendor/xiaomi/ice/proprietary/vendor/firmware/novatek_ts_truly_fw.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/novatek_ts_truly_fw.bin \
    vendor/xiaomi/ice/proprietary/vendor/firmware/novatek_ts_truly_mp.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/novatek_ts_truly_mp.bin

PRODUCT_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery \
    libmtk_bsg.recovery

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl

# Manifest
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/vintf/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(LOCAL_PATH)/vintf/compatibility_matrix.xml

# Properties
TARGET_SYSTEM_PROP += device/xiaomi/ice/configs/prop/system.prop
TARGET_VENDOR_PROP += device/xiaomi/ice/configs/prop/vendor.prop
TARGET_PRODUCT_PROP += device/xiaomi/ice/configs/prop/product.prop

# Vendor properties
PRODUCT_VENDOR_PROPERTIES += \
    debug.renderengine.backend=gles

PRODUCT_PACKAGES += \
    fstab.enableswap \
    fstab.mt6761 \
    factory_init.connectivity.common.rc \
    factory_init.connectivity.rc \
    factory_init.project.rc \
    factory_init.rc \
    init.aee.rc \
    init.ago.rc \
    init.cgroup.rc \
    init.connectivity.common.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6761.rc \
    init.mt6761.usb.rc \
    init.project.rc \
    init.sensor_1_0.rc \
    init.zram.rc \
    init_connectivity.rc \
    meta_init.connectivity.common.rc \
    meta_init.connectivity.rc \
    meta_init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    meta_init.vendor.rc \
    multi_init.rc \
    init.target.rc

PRODUCT_PROPERTY_OVERRIDES += fw.max_users=1

# Display device config - fixes DisplayDeviceConfig nits spam causing watchdog kill

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

PRODUCT_PACKAGES += \
    Dialer

# enable BesLoudness audio support
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/AudioParamOptions.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_param/AudioParamOptions.xml \
    $(LOCAL_PATH)/configs/audio/AudioParamOptions_vext.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_param/AudioParamOptions_vext.xml

PRODUCT_PACKAGES += \
    Launcher3QuickStepGo \
    NoNavigationBarModeGestural

PRODUCT_PROPERTY_OVERRIDES += \
    fw.max_users=1

# Reduce GC pressure on foreground apps
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.foreground-heap-growth-multiplier=2.0

# Use Go-optimized SystemUI for low-RAM device
PRODUCT_PACKAGES += \
    SystemUIGo

DONT_UNCOMPRESS_PRIV_APPS_DEXS := true

PRODUCT_COPY_FILES += \

# Device-specific utilities
PRODUCT_PACKAGES += \
    chipinfo \
    wlan_assistant \
    libaedv

PRODUCT_PACKAGES += \
    libmtkperf_client_vendor \
    libpowerhalwrap_vendor \
    libperfctl_vendor

# RRO
PRODUCT_PACKAGES += \
    IceFrameworkOverlay \
    IceFrameworkTelephonyOverlay \
    IceNetworkStackOverlay \
    IceWifiHotsportOverlay \
    DialerOverlayIce \
    ApertureOverlayIce \
    IceFrameworkResOverlay \
    IceFrameworkResOverlayExt

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/modules/bt_drv_connac1x.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/bt_drv_connac1x.ko \
    $(LOCAL_PATH)/prebuilts/modules/connfem.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/connfem.ko \
    $(LOCAL_PATH)/prebuilts/modules/fmradio_drv_mt6631.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/fmradio_drv_mt6631.ko \
    $(LOCAL_PATH)/prebuilts/modules/fpsgo.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/fpsgo.ko \
    $(LOCAL_PATH)/prebuilts/modules/gps_drv.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/gps_drv.ko \
    $(LOCAL_PATH)/prebuilts/modules/met.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/met.ko \
    $(LOCAL_PATH)/prebuilts/modules/mi_memory.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/mi_memory.ko \
    $(LOCAL_PATH)/prebuilts/modules/modules.alias:$(TARGET_COPY_OUT_VENDOR)/lib/modules/modules.alias \
    $(LOCAL_PATH)/prebuilts/modules/modules.dep:$(TARGET_COPY_OUT_VENDOR)/lib/modules/modules.dep \
    $(LOCAL_PATH)/prebuilts/modules/modules.load:$(TARGET_COPY_OUT_VENDOR)/lib/modules/modules.load \
    $(LOCAL_PATH)/prebuilts/modules/modules.softdep:$(TARGET_COPY_OUT_VENDOR)/lib/modules/modules.softdep \
    $(LOCAL_PATH)/prebuilts/modules/mt6357-accdet.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/mt6357-accdet.ko \
    $(LOCAL_PATH)/prebuilts/modules/trace_mmstat.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/trace_mmstat.ko \
    $(LOCAL_PATH)/prebuilts/modules/wlan_drv_gen4m.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/wlan_drv_gen4m.ko \
    $(LOCAL_PATH)/prebuilts/modules/wmt_chrdev_wifi.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/wmt_chrdev_wifi.ko \
    $(LOCAL_PATH)/prebuilts/modules/wmt_drv.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/wmt_drv.ko

PRODUCT_PACKAGES += \
    android.hardware.health@2.1-service \
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
    libstagefright_bufferpool@2.0.1.vendor

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

PRODUCT_PACKAGES += \
    android.hardware.audio.service.mediatek \
    libaudiofoundation.vendor \
    libhidltransport.vendor \
    libhwbinder.vendor \
    libavservices_minijail_vendor.vendor \
    libdrm.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
    hardware/interfaces/keymaster/4.1/default/android.hardware.hardware_keystore.km41.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.hardware_keystore.km41.xml \
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
    android.hardware.light-service.ice

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-com.mediatek.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.mediatek.ims.xml
